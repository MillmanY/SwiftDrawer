//
//  SliderContainer.swift
//  DrawerDemo
//
//  Created by Millman on 2019/6/26.
//  Copyright © 2019 Millman. All rights reserved.
//

import SwiftUI
import Combine

struct SliderContainer<Content: SliderViewProtocol> : View {
    @ObjectBinding public var control: DrawerControl
    @ObjectBinding private var status: SliderStatus
    
    let slider: AnyView
    let type: SliderType
    var body: some View {
        GeometryReader { proxy in
            self.generateSlider(parentSize: proxy.size)
        }

    }
    
    func generateSlider(parentSize: CGSize) -> some View {
        
        self.status.parentSize = parentSize
        switch self.status.type {
        case .leftFront,  .rightFront:
            let view = self.slider
                .frame(maxWidth:
                    self.status.sliderWidth)
                .offset(x: self.status.sliderOffset() , y: 0)
                .animation(.default)
                .gesture(DragGesture().onChanged({ (value) in
                    if self.status.type.isLeft && value.translation.width < 0 {
                        self.status.currentStatus = .moving(offset: value.translation.width)
                    } else if !self.status.type.isLeft && value.translation.width > 0 {
                        self.status.currentStatus = .moving(offset: value.translation.width)
                    }
                }).onEnded({ (value) in
                    if self.status.type.isLeft {
                        let sliderW = self.status.sliderWidth/2
                        self.status.currentStatus = value.location.x < sliderW ? .hide : .show
                    } else {
                        let sliderW = parentSize.width-self.status.sliderWidth/2
                        self.status.currentStatus = value.location.x > sliderW ? .hide : .show
                    }
                }))
            return AnyView(view)
        case .leftRear, .rightRear:
            let view = self.slider
                .offset(x: self.status.type.isLeft ? 0 : parentSize.width-self.status.sliderWidth, y: 0)
                .animation(.default)
                .frame(maxWidth: self.status.sliderWidth)
            return AnyView(view)
        case .none:
            return AnyView(EmptyView())
        }
    }
    

    init(content: Content, drawerControl: DrawerControl) {
        self.slider = AnyView.init(content.environmentObject(drawerControl))
        self.type = content.type
        self.control = drawerControl
        self.status = drawerControl.status[content.type]!
    }
}

#if DEBUG
struct SliderContainer_Previews : PreviewProvider {
    static var previews: some View {
        self.generate()
    }
    
    static func generate() -> some View {
        let view = DemoSlider.init(type: .leftRear)
        let c = DrawerControl()
        c.setSlider(view: view)
        return SliderContainer(content: view, drawerControl: c)
    }
}
#endif
