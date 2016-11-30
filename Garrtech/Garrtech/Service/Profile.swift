//
//  Profile.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation
import UIKit

class Profile {
    
    var user_id: String?
    var image: UIImage?
    var imageURL: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    
    
    func populateWithJSON(dict: JSONDictionary) {
        
        if let user_id = dict[KUser_id] as? String {
            self.user_id = user_id
        }
        
        if let imageURL = dict[kUser_avatar] as? String {
            self.imageURL = imageURL
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
    }
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let first_name = first_name { dict[kfirst_name] = first_name as AnyObject? }
        if let last_name = last_name { dict[klast_name] = last_name as AnyObject? }
        if let email = email { dict[kEmail] = email as AnyObject? }
        if let imageURL = imageURL { dict[kUser_avatar] = imageURL as AnyObject? }
        
        return dict
    }
}
