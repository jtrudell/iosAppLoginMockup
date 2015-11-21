//
//  UserModel.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/21/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import Foundation

import UIKit

class CrumbUser {
    let firstName: String
    let lastName: String
    let email: String
    let fullName: String
    
    let emailKey = "email"
    let nameKey = "name"
    let loggedinKey = "loggedin"
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.fullName = "\(firstName) \(lastName)"
    }
    
    func setUserDefaults() {
        defaults.setObject(self.email, forKey: emailKey)
        defaults.setObject(self.firstName, forKey: nameKey)
        defaults.setObject("yes", forKey: loggedinKey)
        print("\(self.email) logged in")
    }
    
    class func logOut() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("no", forKey: "loggedin")
        defaults.setObject("none", forKey: "email")
        defaults.setObject("none", forKey: "name")
    }
    
    
    class func retrieveLoginStatus() -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        let status = defaults.objectForKey("loggedin")
        
        if (status == nil || status === "no") {
            return "no"
        } else {
            return "yes"
        }
    }
    
}

