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
        
        List {
            HeaderView()
            
            SliderCell(imgName: "home", title: "Home").onTapGesture {
                self.drawerControl.setMain(view: HomeView())
                self.drawerControl.show(type: .leftRear, isShow: false)
            }.onAppear {
                    
            }
            
            SliderCell(imgName: "account", title: "Account").onTapGesture {
                self.drawerControl.setMain(view: AccountView())
                self.drawerControl.show(type: .leftRear, isShow: false)
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
