//
//  UserDefaultsExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 21/07/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension UserDefaults {
    //MARK: 保存数据
    static func save<T>(value:T,key:String) -> () {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    //MARK: 根据key获取数据
    static func get<T>(key:String) -> T? {
        let userDefault = UserDefaults.standard
        if let ob = userDefault.object(forKey: key) {
            return ob as? T
        }else{
            return nil
        }
    }
}
