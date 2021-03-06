//
//  Login.swift
//  Garrtech
//
//  Created by Ankit on 17/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation
import Alamofire


enum CompleteStep {
    case BusinessInfo,CompanyInfo,OwnerInfo,DocList
}


class Login {
    
    var email: String?
    var password: String?
    var device_id: String? = deviceID
    var os_type: String? = "iOS"
    var push_token: String? = "qwertyuiop"
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        if let email = email { dict[kEmail] = email as AnyObject? }
        if let password = password { dict[kPassword] = password as AnyObject? }
        if let device_id = device_id { dict[kDeviceID] = device_id as AnyObject? }
        if let os_type = os_type { dict[kOS_type] = os_type as AnyObject? }
        if let push_token = push_token { dict[kPush_Token] = push_token as AnyObject? }
        
        return dict
    }
    
}

class CurrentUser {
    
    var id: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var is_confirm: String?
    var api_key: String?
    var image: String?
    var pendingApp: PendingApp?
    
    
    //MARK: ----- Pending APP -----
    //MARK:
    
    
    public class var sharedInstance: CurrentUser {
        struct Singleton {
            static let instance: CurrentUser = CurrentUser()
        }
        return Singleton.instance
    }
    
    init() {
        
        if let tempUser = UserDefaults.standard.object(forKey: kUSERLOGIN) as? JSONDictionary {
            self.populateWithJSON(dict: tempUser)
        }
        
    }
    
    func populateWithJSON(dict:JSONDictionary) {
        
        if let id = dict[KUser_id] as? String{
            self.id = id
        }
        
        if let first_name = dict[kfirst_name] as? String {
            self.first_name = first_name
        }
        
        if let last_name = dict[klast_name] as? String {
            self.last_name = last_name
        }
        
        if let email = dict[kEmail] as? String {
            self.email = email
        }
        
        if let is_confirm = dict[kIS_confirm] as? String {
            self.is_confirm = is_confirm
        }
        
        if let api_key = dict[kApi_key] as? String {
            self.api_key = api_key
        }
        
        if let image = dict[kUser_avatar] as? String{
            self.image = image
        }
        
        if let pendingApp = dict[kAPP_Pending] as? JSONDictionary {
            let pendingAppTemp = PendingApp()
            pendingAppTemp.populateWithJSON(dict: pendingApp)
            self.pendingApp = pendingAppTemp
        }
    }
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict : JSONDictionary = [:]

        if let id = id { dict[KUser_id] = id as AnyObject? }
        if let first_name = first_name { dict[kfirst_name] = first_name as AnyObject? }
        if let last_name = last_name { dict[klast_name] = last_name as AnyObject? }
        if let email = email { dict[kEmail] = email as AnyObject? }
        if let is_confirm = is_confirm { dict[kIS_confirm] = is_confirm as AnyObject? }
        if let api_key = api_key { dict[kApi_key] = api_key as AnyObject? }
        if let image = image { dict[kUser_avatar] = image as AnyObject? }
        if let pendingApp = pendingApp {
            dict[kAPP_Pending] = pendingApp.toJsonDict() as AnyObject?
        }
        return dict
    }
    
    func saveToDEfault() {
        UserDefaults.standard.set(nil, forKey: kUSERLOGIN)
        UserDefaults.standard.set(self.toJsonDictionary(), forKey: kUSERLOGIN)
        self.populateWithJSON(dict: self.toJsonDictionary())
    }
    
    func setAuthHeader() -> HTTPHeaders {
        
        return ["x-api-key":(self.api_key as AnyObject) as! String]
        
    }
    
}

class ForgotPassword {
    
    var email: String?
    
    func toJsonDict() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let email = email { dict[kEmail] = email as AnyObject? }
        
        return dict
    }
    
    
}
