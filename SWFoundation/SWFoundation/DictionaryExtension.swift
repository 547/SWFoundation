//
//  DictionaryExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension Dictionary {
    var nsdictionary: NSDictionary { return (self as NSDictionary) }
}

public extension Dictionary {
    func string(forKey key: String) -> String? {
        return nsdictionary.string(forKey: key)
    }
    func int(forKey key: String) -> Int? {
        return nsdictionary.int(forKey: key)
    }
    func float(forKey key: String) -> Float? {
        return nsdictionary.float(forKey: key)
    }
    func double(forKey key: String) -> Double? {
        return nsdictionary.double(forKey: key)
    }
    func bool(forKey key: String) -> Bool? {
        return nsdictionary.bool(forKey: key)
    }
    func standardDictionary(forKey key: String) -> [String : Any]? {
        return nsdictionary.value(forKey: key) as? [String : Any]
    }
    func array<T>(forKey key: String) -> [T]? {
        return nsdictionary.value(forKey: key) as? [T]
    }
    func decimal(forKey key: String) -> Decimal? {
        return string(forKey: key)?.decimal
    }
}

public extension Dictionary {
    mutating func merge<K, V>(with dictionarys: Dictionary<K, V>...) {
        for dictionary in dictionarys {
            for (key, value) in dictionary {
                updateValue(value as! Value, forKey: key as! Key)
            }
        }
    }
}

public func + <K, V>(lhs: [K : V], rhs: [K : V]) -> [K : V] {
    var result = [K : V]()
    for (key, value) in lhs {
        result[key] = value
    }
    for (key, value) in rhs {
        result[key] = value
    }
    return result
}
public func += <K, V>( lhs: inout [K : V], rhs: [K : V]) {
    for (k, v) in rhs {
        lhs[k] = v
    }
}
