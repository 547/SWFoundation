//
//  StringExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension String {
    var length: Int { return self.count }
    var nsstring: NSString { return self as NSString }
    var empty: Bool { return isEmpty }
    
    var intValue: Int? { return Int(self) }
    var floatValue: Float? { return Float(self) }
    var doubleValue: Double? { return Double(self) }
    
    var securedPhoneNumber: String {
        let convertedPhoneNumberPreffix = substring(from: 0, to: length == 8 ? 2 : 3)
        let convertedPhoneNumberSuffix = substring(from: length - (length == 8 ? 3 : 4), to: length) 
        return "\(convertedPhoneNumberPreffix)\(length == 8 ? "***" : "****")\(convertedPhoneNumberSuffix)"
    }
    
    init(fromDate date: Date, dateFormat format: String) {
        let dateFormatter = DateFormatter(dateFormat: format)
        self = dateFormatter.string(from: date)
    }
}
public extension String {
    static var blank: String { return "" }
    
    static func number(_ number: Int) -> String {
        return "\(number)"
    }
    static func number(_ number: Float) -> String {
        return "\(number)"
    }
    static func number(_ number: Double) -> String {
        return "\(number)"
    }
    static func number(_ number: CGFloat) -> String {
        return "\(number)"
    }
    static func bool(_ bool: Bool) -> String {
        return "\(bool ? "true" : "false")"
    }
}

public extension String {
    func toArray() -> [String] {
        return self.map { String($0) }
    }
}
public extension String {
    // 获取字符串的第一个字母
    var firstLetter: String {
        var ret = ""
        if canBeConverted(to: .ascii).no {
            ret = toLetters().firstLetter
        } else {
            ret = self.first != nil ? String(self.first!) : "" 
        }
        return ret
    }
    // 将字符串里的汉字转换为字母
    func toLetters() -> String {
        let string = NSMutableString(string: self)
        guard CFStringTransform(string, nil, kCFStringTransformToLatin, false) else { return self }
        guard CFStringTransform(string, nil, kCFStringTransformStripDiacritics, false) else { return self }
        return string as String
    }
}
public extension String {
    var reversed: String {
        var string = self
        string.reverse()
        return string
    }
    // 获取倒序排序后的字符串
    mutating func reverse() {
        let mappedCharacters = self.map{ return $0 }
        let reversed = mappedCharacters.reversed()
        self = String(reversed)
    }
}

public extension String {
    func split(_ separator: Character) -> [String] {
        return self.split(separator: separator).map(String.init)
    }
    func split(from start: Int, to end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }
    
    func substring(from start: Int, to end: Int) -> String {
        return String(self[index(startIndex, offsetBy: start)..<index(startIndex, offsetBy: end)])
    }
}

public extension String {
    func size(withFont font: UIFont) -> CGSize {
        guard isEmpty.no else { return .zero }
        return nsstring.size(withAttributes: [NSAttributedStringKey.font : font])
    }
    func height(withFont font: UIFont, width: CGFloat) -> CGFloat {
        guard isEmpty.no else { return 0 }
        return (size(withFont: font).width / width) * size(withFont: font).height
    }
}

public extension String {
    func isAllNumber() -> Bool {
        let inverseSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let components = self.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return self == filtered
    }
    func isAllSpace() -> Bool {
        let text = self.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        return !(text.length > 0)
    }
}
public extension String {
    func trimWhitespacesOfHeadAndTail() -> String? {
        let result = self.trimmingCharacters(in: .whitespaces)
        if result.length > 0{
            return result
        }
        return nil
    }
}

public extension String {
    var md5: String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = self.data(using: .utf8) {
            _ = d.withUnsafeBytes { body in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }
        
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
}


public extension String {
    var decimal: Decimal? {
        return Decimal.init(string: self)
    }
}
