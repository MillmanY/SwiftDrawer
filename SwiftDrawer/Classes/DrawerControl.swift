//
//  DrawerControl.swift
//  SwiftDrawer
//
//  Created by Millman on 2019/6/30.
//

import Foundation
import SwiftUI
import Combine
public class DrawerControl: BindableObject {
    public let didChange = PassthroughSubject<DrawerControl, Never>()
    private(set) var status = [SliderType: SliderStatus]()
    private(set) var sliderView = [SliderType: AnyView]() {
        didSet {
            didChange.send(self)
        }
    }

    private(set) var main: AnyView? {
        didSet {
            didChange.send(self)
        }
    }
    
    var maxShowRate: Length {
        get {
            let max = status.sorted { (s0, s1) -> Bool in
                s0.value.showRate > s1.value.showRate
            }.first?.value.showRate ?? 0
            return max
        }
    }
 
    public func setSlider<Slider: SliderViewProtocol>(view: Slider, widthType: SliderWidth = .percent(rate: 0.6)) {
        let status = SliderStatus(type: view.type)
        status.maxWidth = widthType
        self.status[view.type] = status
        self.sliderView[view.type] = AnyView(SliderContainer(content: view, drawerControl: self))
    }

    public func setMain<Main: View>(view: Main) {
        let container = MainContainer(content: view, drawerControl: self)
        self.main = AnyView(container)
    }
    
    public func show(type: SliderType, isShow: Bool) {
        self.status[type]?.currentStatus = isShow ? .show: .hide
    }
    
    public func hideAllSlider() {
        self.status.forEach {
            $0.value.currentStatus = .hide
        }
    }
}
