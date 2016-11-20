//
//  Register.swift
//  Garrtech
//
//  Created by Ankit on 17/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation


class Register {

    var first_name: String?
    var last_name: String?
    var email: String?
    var password: String?
    var device_id: String?
    var os_type: String?
    var push_token: String?
    
    func toJsonDictionary() -> JSONDictionary {
        var dict: JSONDictionary = [:]
        if let first_name = first_name { dict[kfirst_name] = first_name as AnyObject? }
        if let last_name = last_name { dict[klast_name] = last_name as AnyObject? }
        if let email = email { dict[kEmail] = email as AnyObject? }
        if let password = password { dict[kPassword] = password as AnyObject? }
        if let device_id = device_id { dict[kDeviceID] = device_id as AnyObject? }
        if let os_type = os_type { dict[kOS_type] = os_type as AnyObject? }
        if let push_token = push_token { dict[kPush_Token] = push_token as AnyObject? }
        return dict
    }
    
}

class ChangePassword {
    
    var user_id: String?
    var old_password: String?
    var new_password: String?
    var confirm_password: String?
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let old_password  = old_password { dict[kOld_password] = old_password as AnyObject? }
        if let new_password  = new_password { dict[kNew_password] = new_password as AnyObject? }
        if let confirm_password = confirm_password { dict[kConfirm_password] = confirm_password as AnyObject? }
        
        return dict
        
        
    }
    
}

