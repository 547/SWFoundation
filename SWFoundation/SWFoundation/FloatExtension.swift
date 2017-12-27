//
//  FloatExtension.swift
//  iFoodMacau-Delivery
//
//  Created by seven on 2017/11/2.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import Foundation
public extension Float {
    enum Accuracy {
        ///整数
        case none
        ///精确到小数点后一位
        case tenths
        ///精确到小数点后两位
        case percentile
        ///精确到小数点后三位
        case thousands
    }
    ///获取该数值精确到几位数
    func getAccuracy() -> Accuracy {
        var result:Accuracy = .none
        let tempInt = self.int
        let tempToTenths = Int((self - tempInt.float) * 10)
        let tempToPercentile = Int((self - tempInt.float) * 100)
        let tempToThousands = Int((self - tempInt.float) * 1000)
        if tempToPercentile == 0 && tempToTenths == 0 && tempToThousands == 0 {
            result = .none
        }else if tempToTenths * 10 == tempToPercentile && tempToTenths * 100 == tempToThousands {
            result = .tenths
        }else if tempToPercentile * 10 == tempToThousands {
            result = .percentile
        }else if tempToThousands != 0 {
            result = .thousands
        }
        return result
    }
    ///获取数值的字符串 根据该数值精确的位数
    func getAccuracyText() -> String {
        var result = "\(self)"
        let accuracy = getAccuracy()
        switch accuracy {
        case .none:
            result = "\(String(format: "%.0f", self))"
        case .tenths:
            result = "\(String(format: "%.1f", self))"
        case .percentile:
            result = "\(String(format: "%.2f", self))"
        case .thousands:
            result = "\(String(format: "%.3f", self))"
        }
        return result
    }
}
