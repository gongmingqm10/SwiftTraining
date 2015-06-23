//
//  UserDefaultManager.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/23/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class UserDefaultManager: NSObject {
    
    let loginStatusKey = "loginStatus"
    
    private let preferences: NSUserDefaults
    
    override init() {
        preferences = NSUserDefaults.standardUserDefaults()
    }
    
    class var sharedInstance: UserDefaultManager {
        return userDefaultManager
    }
    
    func getLoginStatus() -> Bool {
        if let loginStatus = preferences.objectForKey(loginStatusKey) {
            return loginStatus as! Bool
        } else {
            return false
        }
    }
    
    func saveLoginStatus(status: Bool) -> Bool{
        preferences.setBool(status, forKey: loginStatusKey)
        return preferences.synchronize()
    }
    
}

private let userDefaultManager: UserDefaultManager = {
    return UserDefaultManager()
}()