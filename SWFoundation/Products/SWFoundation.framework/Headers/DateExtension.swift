//
//  DateExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 26/07/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension Date {
    init?(fromString dateString: String, dateFormat: String) {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        self = date
    }
}
public extension Date {
    enum Unit {
        case year(Int);case month(Int);case week(Int);case day(Int);case hour(Int);case minute(Int);case second(Int)
        
        var value: Int {
            switch self {
            case .year(let tempValue):      return tempValue
            case .week(let tempValue):      return tempValue
            case .month(let tempValue):     return tempValue
            case .day(let tempValue):       return tempValue
            case .hour(let tempValue):      return tempValue
            case .minute(let tempValue):    return tempValue
            case .second(let tempValue):    return tempValue
            }
        }
    }
    
    func offset(from date: Date, component: Calendar.Component) -> Unit? {
        let dateComponents = Calendar.current.dateComponents([component], from: date, to: self)
        
        switch component {
        case .year:         return .year(dateComponents.year ?? 0)
        case .month:        return .month(dateComponents.month ?? 0)
        case .day:          return .day(dateComponents.day ?? 0)
        case .weekOfYear:   return .week(dateComponents.weekOfYear ?? 0)
        case .hour:         return .hour(dateComponents.hour ?? 0)
        case .minute:       return .minute(dateComponents.minute ?? 0)
        case .second:       return .second(dateComponents.second ?? 0)
            
        default: return nil
        }
    }
}
public extension Date {
    func isSameDay(_ day: Date) -> Bool {
        return Calendar.current.compare(self, to: day, toGranularity: .day) == .orderedSame
    }
}
public extension Date {
    static func date(from string: String, withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
public extension Date {
    fileprivate var dateComponents: DateComponents { 
        get { 
            return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        }
    }
//    static func make(withYear year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
//        
//    }
    var year: Int? {
        return dateComponents.year
    }
    var month: Int? {
        return dateComponents.month
    }
    var day: Int? {
        return dateComponents.day
    }
    var hour: Int? {
        return dateComponents.hour
    }
    var minute: Int? {
        return dateComponents.minute
    }
    var second: Int? {
        return dateComponents.second
    }
    mutating func make(year: Int) {
        var dateComponents = self.dateComponents
        dateComponents.year = year
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }
    }
    mutating func make(month: Int) {
        var dateComponents = self.dateComponents
        dateComponents.month = month
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }
    }
    mutating func make(day: Int) {
        var dateComponents = self.dateComponents
        dateComponents.day = day
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }  
    }
    mutating func make(hour: Int) {
        var dateComponents = self.dateComponents
        dateComponents.hour = hour
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }
    }
    mutating func make(minute: Int) {
        var dateComponents = self.dateComponents
        dateComponents.minute = minute
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }
    }
    mutating func make(second: Int) {
        var dateComponents = self.dateComponents
        dateComponents.second = second
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        }
    }
}
