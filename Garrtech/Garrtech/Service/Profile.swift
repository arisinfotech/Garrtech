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
    var first_name: String?
    var last_name: String?
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let first_name = first_name { dict[kfirst_name] = first_name as AnyObject? }
        if let last_name = last_name { dict[klast_name] = last_name as AnyObject? }
        
        return dict
    }
    
}
