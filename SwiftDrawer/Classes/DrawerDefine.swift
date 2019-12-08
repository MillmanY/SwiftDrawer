//
//  DrawerDefine.swift
//  DrawerDemo
//
//  Created by Millman on 2019/6/26.
//  Copyright © 2019 Millman. All rights reserved.
//

import Foundation
import SwiftUI
public enum SliderType {
    case leftRear
    case rightRear
    case leftFront
    case rightFront
    case none
    var isLeft: Bool {
        return self == .leftRear || self == .leftFront
    }
    
    var isRear: Bool {
        return self == .leftRear || self == .rightRear
    }
}

public enum SliderWidth {
    case width(value: CGFloat)
    case percent(rate: CGFloat)
}

public enum ShowStatus {
    case show
    case hide
    case moving(offset: CGFloat)
    
    var isMoving: Bool {
        switch self {
        case .moving(_):
            return true
        default:
            return false
        }
    }
}



public protocol SliderProtocol {
    var type: SliderType {get}
    init(type: SliderType)
}
public typealias SliderViewProtocol = (View & SliderProtocol)
