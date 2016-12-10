//
//  ScheduleCall.swift
//  Garrtech
//
//  Created by Ankit on 10/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation


class ScheduleCall {
    
    var userID: String?
    var phone: String?
    var dateTime: String?
    
    
    func toJsonDict() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let userID = userID { dict[KUser_id] = userID as AnyObject? }
        if let phone = phone { dict[kPhone] = phone as AnyObject? }
        if let dateTime = dateTime { dict[kschedule_date_time] = dateTime as AnyObject? }
        return dict
    }
    
}
