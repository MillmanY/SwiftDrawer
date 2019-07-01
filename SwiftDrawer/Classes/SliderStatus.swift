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

public class SliderStatus: BindableObject {
    public let didChange = PassthroughSubject<SliderStatus, Never>()
    var parentSize = CGSize.zero
    var sliderWidth: Length {
        get {
            switch self.maxWidth {
            case .percent(let rate):
                return parentSize.width*rate
            case .width(let value):
                return value
            }
        }
    }
    public var showRate: Length = 0
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
                    showRate = 1-(width-offset)/width
                } else {
                    showRate = 1-(width+offset)/width
                }
            }
            didChange.send(self)
        }
    }
    public var type: SliderType {
        didSet {
            didChange.send(self)
        }
    }
    var maxWidth: SliderWidth = .percent(rate: 0.5) {
        didSet {
            didChange.send(self)
        }
    }
    
    func sliderOffset() -> Length {
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
                return self.type.isLeft ? offset : parentSize.width-rearW+offset
            case .show:
                return self.type.isLeft ? 0 : parentSize.width-rearW
            }
        }
    }
    
    init(type: SliderType) {
        self.type = type
    }
}
