//
//  NumberExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public typealias Byte = UInt8

public extension Int {
    var cgfloat:    CGFloat { return CGFloat(self)      }
    var float:      Float   { return Float(self)        }
    var double:     Double  { return Double(self)       }
    var byte:       Byte    { return Byte(self)         }
    var half:       Int     { return self / 2           }
    var square:     Int     { return self * self        }
    var cube:       Int     { return self * self * self }
    var opposite:   Int     { return -self              }
    var absolute:   Int     { return abs(self)          }
}
public extension Float {
    var cgfloat:    CGFloat { return CGFloat(self)      }
    var int:        Int     { return Int(self)          }
    var roundedInt: Int     { return Int(roundf(self))  }
    var double:     Double  { return Double(self)       }
    var half:       Float   { return self / 2           }
    var opposite:   Float   { return -self              }
    var absolute:   Float   { return abs(self)          }
}
public extension Double {
    var cgfloat:    CGFloat { return CGFloat(self)  }
    var int:        Int     { return Int(self)      }
    var float:      Float   { return Float(self)    }
    var half:       Double  { return self / 2       }
    var opposite:   Double  { return -self          }
    var absolute:   Double  { return abs(self)      }
}
public extension Byte {
    var cgfloat:    CGFloat { return CGFloat(self)  }
    var int:        Int     { return Int(self)      }
}

public extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex { decimalBase *= 10 }
        return (self / decimalBase) % 10
    }
}

public func ^ (left: Double, right: Double) -> Double {
    return pow(left, right)
}
infix operator ^=
public func ^= (left: inout Double, right: Double) {
    left = left ^ right
}

prefix operator √
public prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
infix operator ±
public func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ±
public prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}
