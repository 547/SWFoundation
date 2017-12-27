//
//  CGFloatExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 25/07/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension CGFloat {
    var int :       Int     { return Int(self)              }
    var float :     Float   { return Float(self)            }
    var double:     Double  { return Double(self)           }
    var half:       CGFloat { return self / 2               }
    var square:     CGFloat { return (self * self)          }
    var cube:       CGFloat { return (self * self * self)   }
    var opposite:   CGFloat { return -self                  }
    var absolute:   CGFloat { return abs(self)              }
}
