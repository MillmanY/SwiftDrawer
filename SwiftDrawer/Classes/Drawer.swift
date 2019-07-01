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
    @ObjectBinding private var drawerControl = DrawerControl()
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
    public func set<Main: View>(main: Main) -> Drawer {
        drawerControl.setMain(view: main)
        return self
    }
    
    @discardableResult
    public func set<Slider: SliderViewProtocol>(slider: Slider) -> Drawer{
        drawerControl.setSlider(view: slider)
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
        Drawer().set(main: DemoMain())
                .set(slider: DemoSlider.init(type: .leftRear))
    }
}
#endif
