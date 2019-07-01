//
//  ContentView.swift
//  DrawerDemo
//
//  Created by Millman on 2019/6/25.
//  Copyright © 2019 Millman. All rights reserved.
//

import SwiftUI
import SwiftDrawer
struct ContentView : View {
    var body: some View {
        Drawer()
            .set(slider: SliderView(type: .leftRear))
//            .set(slider: SliderView(type: .rightRear))
            .set(main: HomeView())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
