//
//  Drawer.swift
//  DrawerDemo
//
//  Created by Millman on 2019/6/25.
//  Copyright © 2019 Millman. All rights reserved.
//

import SwiftUI
import Combine

public struct Drawer: View {
    @ObservedObject private var drawerControl = DrawerControl()
    public var body: some View {
        ZStack {
            drawerControl.sliderView[.leftRear]
            drawerControl.sliderView[.rightRear]
            drawerControl.main
            drawerControl.sliderView[.rightFront]
            drawerControl.sliderView[.leftFront]
        }
    }
    
    @discardableResult
    public func setMain<Main: View>(view: Main) -> Drawer {
        drawerControl.setMain(view: view)
        return self
    }
    
    @discardableResult
    public func setSlider<Slider: SliderViewProtocol>(view: Slider,
                                                widthType: SliderWidth = .percent(rate: 0.6),
                                                shadowRadius: CGFloat = 10) -> Drawer{
        drawerControl.setSlider(view: view, widthType: widthType, shadowRadius: shadowRadius)
        return self
    }
    
    public init() {}
}

#if DEBUG
public struct DemoMain: View {
    public var body: some View {
        Text("AAA")
    }
}

public struct DemoSlider: View, SliderProtocol {
    public var body: some View {
        Text("Slider")
    }
    public let type: SliderType
    public init(type: SliderType) {
        self.type = type
    }

}

struct Drawer_Previews : PreviewProvider {
    static var previews: some View {
        Drawer().setMain(view: DemoMain())
                .setSlider(view: DemoSlider.init(type: .leftRear))
    }
}
#endif
