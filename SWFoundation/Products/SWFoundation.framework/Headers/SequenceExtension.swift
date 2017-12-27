//
//  SequenceExtension.swift
//  iFoodMacau-Delivery
//
//  Created by seven on 2017/9/14.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import Foundation
public extension Sequence {
    public func toDictionary<Key: Hashable>(with selectKey: (Iterator.Element) -> Key) -> [Key:Iterator.Element] {
        var dict: [Key:Iterator.Element] = [:]
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
    public func toDictionaryContainsArray<Key: Hashable>(with selectKey: (Iterator.Element) -> Key) -> [Key:[Iterator.Element]] {
        var dict: [Key:[Iterator.Element]] = [:]
        for element in self {
            var array:[Iterator.Element] = []
            let key = selectKey(element)
            for elementNew in self {
                if selectKey(elementNew) == key {
                    array.append(elementNew)
                }
            }
            dict[key] = array
        }
        return dict
    }
}
