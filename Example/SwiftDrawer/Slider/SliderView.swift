//
//  SliderView.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/6/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftDrawer
struct SliderView : View, SliderProtocol {
    @EnvironmentObject public var drawerControl: DrawerControl
    let type: SliderType
    init(type: SliderType) {
        self.type = type
    }
    var body: some View {
        GeometryReader { proxy in
            List {
                HeaderView()
                Text("Home").tapAction {
                    self.drawerControl.setMain(view: HomeView())
                    self.drawerControl.show(type: .leftRear, isShow: false)

//                    self.status.currentStatus = .hide
                }
                Text("Account").tapAction {
                    
                    self.drawerControl.setMain(view: MainView2())
                    self.drawerControl.show(type: .leftRear, isShow: false)
//                    self.status.currentStatus = .hide
                }
                
                
                }
            
        }
        
    }
}


#if DEBUG
struct SliderView_Previews : PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
#endif
