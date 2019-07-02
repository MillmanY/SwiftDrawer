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
    @EnvironmentObject public var control: DrawerControl

    var body: some View {
        NavigationView {
    
            Text("Home View in Main")
                .navigationBarTitle(Text("Home"), displayMode: .inline)
                .navigationBarItems(leading: Image("menu").tapAction {
                    self.control.show(type: .leftRear, isShow: true)
                }, trailing: Text("right").tapAction {
                    self.control.show(type: .rightFront, isShow: true)
                })
        }
        .foregroundColor(Color.red)
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
