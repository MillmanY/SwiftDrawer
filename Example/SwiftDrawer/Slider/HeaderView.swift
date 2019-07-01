//
//  HeaderView.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/7/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI

struct HeaderView : View {
    var body: some View {
        HStack {
            Image("user").resizable().frame(width: 50, height: 50, alignment: .trailing)
            VStack(alignment: .leading) {
                Text("Millman")
                Text("mm@gmail.com")
            }
        }
    }
}

#if DEBUG
struct HeaderView_Previews : PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
#endif
