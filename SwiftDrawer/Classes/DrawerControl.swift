//
//  DrawerControl.swift
//  SwiftDrawer
//
//  Created by Millman on 2019/6/30.
//

import Foundation
import SwiftUI
import Combine
public class DrawerControl: ObservableObject {
//    public let objectDidChange = PassthroughSubject<DrawerControl, Never>()
    
    private var statusObserver = [AnyCancellable]()
    private(set) var status = [SliderType: SliderStatus]() {
        didSet {
            statusObserver.forEach {
                $0.cancel()
            }
            statusObserver.removeAll()
            status.forEach { (info) in
                let observer = info.value.objectDidChange.sink { [weak self](s) in
                    let maxRate = self?.status.sorted { (s0, s1) -> Bool in
                        s0.value.showRate > s1.value.showRate
                        }.first?.value.showRate ?? 0
                    if self?.maxShowRate == maxRate {
                        return
                    }
                    self?.maxShowRate = maxRate
                }
                statusObserver.append(observer)
            }
        }
    }
    @Published
    private(set) var sliderView = [SliderType: AnyView]()
    @Published
    private(set) var main: AnyView?
    @Published
    private(set) var maxShowRate: CGFloat = .zero

    public func setSlider<Slider: SliderViewProtocol>(view: Slider,
                                                      widthType: SliderWidth = .percent(rate: 0.6),
                                                      shadowRadius: CGFloat = 10) {
        let status = SliderStatus(type: view.type)
        
        status.maxWidth = widthType
        status.shadowRadius = shadowRadius
        self.status[view.type] = status
        self.sliderView[view.type] = AnyView(SliderContainer(content: view, drawerControl: self))
    }

    public func setMain<Main: View>(view: Main) {
        let container = MainContainer(content: view, drawerControl: self)
        self.main = AnyView(container)
    }
    
    public func show(type: SliderType, isShow: Bool) {
        
        let haveMoving = self.status.first { $0.value.currentStatus.isMoving } != nil
        if haveMoving {
            return
        }
        self.status[type]?.currentStatus = isShow ? .show: .hide
    }
    
    public func hideAllSlider() {
        self.status.forEach {
            $0.value.currentStatus = .hide
        }
    }
}
