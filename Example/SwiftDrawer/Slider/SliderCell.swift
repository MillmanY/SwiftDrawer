//
//  SliderCell.swift
//  SwiftDrawer_Example
//
//  Created by Millman on 2019/7/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI

struct SliderCell : View {
    private let img: String
    private let title: String
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Image.init(self.img).foregroundColor(.accentColor)
                Text(self.title).foregroundColor(.init("titleColor"))
            }
            .frame(width: proxy.size.width, alignment: .leading)
        }
    }
    
    init(imgName: String, title: String) {
        self.img = imgName
        self.title = title
    }
}

#if DEBUG
struct SliderCell_Previews : PreviewProvider {
    static var previews: some View {
        SliderCell()
    }
}
#endif
