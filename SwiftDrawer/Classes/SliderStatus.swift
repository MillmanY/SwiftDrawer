//
//  SliderStatus.swift
//  DrawerDemo
//
//  Created by Millman on 2019/6/26.
//  Copyright © 2019 Millman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class SliderStatus: ObservableObject {
    public let objectDidChange = PassthroughSubject<SliderStatus, Never>()
    var parentSize = CGSize.zero
    var sliderWidth: CGFloat {
        get {
            switch self.maxWidth {
            case .percent(let rate):
                return parentSize.width*rate
            case .width(let value):
                return value
            }
        }
    }
    var shadowRadius: CGFloat = 0
    var showRate: CGFloat = 0
    public var currentStatus: ShowStatus = .hide {
        didSet {
            switch currentStatus {
            case .hide:
                showRate = 0
            case .show:
                showRate = 1
            case .moving(let offset):
                let width = parentSize.width/2
                if self.type.isLeft {
                    showRate = self.type.isRear ? 1-(width-offset)/width : (width+offset)/width
                } else {
                    showRate = (width-offset)/width
                }
            }
            objectDidChange.send(self)
        }
    }
    public var type: SliderType {
        didSet {
            objectDidChange.send(self)
        }
    }
    var maxWidth: SliderWidth = .percent(rate: 0.5) {
        didSet {
            objectDidChange.send(self)
        }
    }
    
    func sliderOffset() -> CGFloat {
        if self.type == .none {
            return 0
        }
        let rearW = self.sliderWidth
        if self.type.isRear {
            switch currentStatus {
            case .hide:
                return 0
            case .moving(let offset):
                return offset
            case .show:
                return self.type.isLeft ? rearW : -rearW
            }
        } else {
            switch currentStatus {
            case .hide:
                return self.type.isLeft ? -parentSize.width : parentSize.width
            case .moving(let offset):
                let o = self.type.isLeft ? offset : parentSize.width-rearW+offset
                return o
            case .show:
                return self.type.isLeft ? 0 : parentSize.width-rearW
            }
        }
    }
    
    init(type: SliderType) {
        self.type = type
    }
}
