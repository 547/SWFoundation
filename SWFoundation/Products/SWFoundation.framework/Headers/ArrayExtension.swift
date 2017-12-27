//
//  ArrayExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension Array {
    var empty: Bool { return count <= 0 }
    var isEmpty: Bool { return empty }
    var hasElement: Bool { return empty.no }
    var firstIndex: Int { return 0 }
    var lastIndex: Int { return isEmpty ? 0 : count - 1 }
}

public extension Array {
    mutating func remove<T>(_ element: T) where T: Equatable {
        self = self.filter { $0 as? T != element }
    }
    func element(_ isIncluded: (Element) throws -> Bool) -> Element? {
        do {
            for temp in self {
                if try isIncluded(temp) {
                    return temp
                }
            } 
        } catch { }
        return nil
    }
}

public extension Array {
    func subarray(from start: Int, to end: Int) -> Array {
        guard isEmpty.no else { return Array() }
        if start > lastIndex {
            return Array()
        } else if end > lastIndex {
            return Array(self[start...lastIndex])
        } else {
            return Array(self[start...end])
        }
    }
    func subarrayToEnd(from start: Int) -> Array {
        return subarray(from: start, to: lastIndex)
    }
    func subarrayFromStart(to end: Int) -> Array {
        return subarray(from: 0, to: end)
    }
    func subarrayFromStart(withLength length: Int) -> Array {
        if length < count {
            return subarrayFromStart(to: length - 1)
        } else {
            return self
        }
    }
    func subarrayFromEnd(withLength length: Int) -> Array {
        if length < count {
            return subarray(from: lastIndex - (length - 1), to: lastIndex)
        } else {
            return self
        }
    }
    func subarray(from start: Int, length: Int) -> Array {
        return subarray(from: start, to: start + length - 1)
    }
}

public extension Array where Element: Hashable {
    /**
     * Remove duplicate elements from an array
     *
     * - returns: A new array without duplicates
     */
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
    
    /**
     * Remove duplicate elements from an array
     */
    mutating func removeDuplicatesInPlace() {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

public func + <T>(lhs: [T], rhs: [T]) -> [T] {
    var result = [T]()
    result.append(contentsOf: lhs)
    result.append(contentsOf: rhs)
    return result
}
public func += <T>( lhs: inout [T], rhs: [T]) {
    lhs.append(contentsOf: rhs)
}
