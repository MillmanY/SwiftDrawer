//
//  MainView1.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/6/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftDrawer
struct HomeView : View {
//    @EnvironmentObject public var control: DrawerControl

    var body: some View {
        
        NavigationView {
            Button.init(action: {
            }) {
//                self.control.status[.leftRear].currentStatus = .show
//                self.drawerControl.status[.leftRear]?.currentStatus = .show

                Text("Taptest")
                }
                .navigationBarTitle(Text("Home"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
