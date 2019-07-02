//
//  MainView2.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/6/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftDrawer
struct AccountView : View {
    @EnvironmentObject public var control: DrawerControl
    var body: some View {
        NavigationView {
            VStack {
                Image("user").padding(.top, 10)
                Divider()
                Text("millman")
                Text("mm@gmail.com")
                Spacer()
            }
            .navigationBarItems(leading: Image("menu").tapAction {
                self.control.show(type: .leftRear, isShow: true)
            }, trailing: Text("right").tapAction {
                self.control.show(type: .rightFront, isShow: true)
            })
            .navigationBarTitle(Text("Account"), displayMode: .inline)
        }
        .foregroundColor(Color.red)
    }
}

#if DEBUG
struct AccountView_Previews : PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
#endif
