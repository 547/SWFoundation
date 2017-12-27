//
//  BoolExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension Bool {
    init(fromString boolString: String) {
        self = (boolString == "1")
    }
    init(fromInt boolInt: Int) {
        self = (boolInt == 1)
    }
}

public extension Bool {
    mutating func toggle() { self = !self }
}

public extension Bool {
    var yes: Bool { return self == true }
    var positive: Bool { return yes }
    var no : Bool { return self == false }
    var negative: Bool { return no }
    var opposite: Bool { return !self }
}

public extension Bool {
    var int: Int { return yes ? 1 : 0 }
    var string: String { return yes ? "1" : "0" }
    func toInt() -> Int { return int }
    func toString() -> String { return string }
}
