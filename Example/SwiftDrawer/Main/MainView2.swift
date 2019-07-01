//
//  MainView2.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/6/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI

struct MainView2 : View {
    var body: some View {
        NavigationView {
            Button.init(action: {
                print("Tap")
            }) {
                Text("MainView2")
                }
                .navigationBarTitle(Text("Main2"), displayMode: .inline)
        }    }
}

#if DEBUG
struct MainView2_Previews : PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}
#endif
