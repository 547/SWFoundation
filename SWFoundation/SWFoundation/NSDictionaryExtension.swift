//
//  NSDictionaryExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension NSDictionary {
    func string(forKey key: String) -> String? {
        return (self.object(forKey: key) as? String)
    }
    func int(forKey key: String) -> Int? {
        if let tempNumber = self.object(forKey: key) as? Int {
            return tempNumber
        } else if let tempString = self.string(forKey: key) {
            return Int(tempString)
        }
        return nil
    }
    func float(forKey key: String) -> Float? {
        if let tempNumber = self.object(forKey: key) as? Float {
            return tempNumber
        } else if let tempInt = self.int(forKey: key) {
            return tempInt.float
        } else if let tempString = self.string(forKey: key) {
            return Float(tempString)
        }
        return nil
    }
    func double(forKey key: String) -> Double? {
        if let tempNumber = self.object(forKey: key) as? Double {
            return tempNumber
        } else if let tempInt = self.int(forKey: key) {
            return tempInt.double
        } else if let tempFloat = self.float(forKey: key) {
            return tempFloat.double
        } else if let tempString = self.string(forKey: key) {
            return Double(tempString)
        }
        return nil
        
    }
    func bool(forKey key: String) -> Bool? {
        if let tempBool = self.int(forKey: key) {
            return Bool(fromInt: tempBool)
        } else if let tempString = self.string(forKey: key) {
            return Bool(fromString: tempString)
        }
        return nil
    }
}
