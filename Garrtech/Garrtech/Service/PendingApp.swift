//
//  PendingApp.swift
//  Garrtech
//
//  Created by Ankit on 03/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class PendingApp {
    
    var appPending: String?
    var applicationID: String?
    var userID: String?
    var stepCompleted: String?
    var isPending: String?
    
    
    func populateWithJSON(dict: JSONDictionary) {
        
        
        if let applicationID = dict[kApplication_id] as? String {
            self.applicationID = applicationID
        }
        
        if let userID = dict[KUser_id] as? String {
            self.userID = userID
        }
        
        if let stepCompleted = dict[kAPP_StepComplete] as? String {
            self.stepCompleted = stepCompleted
        }
        
        if let isPending = dict[kAPP_IsPending] as? String {
            self.isPending = isPending
        }
    }
    
    func toJsonDict() -> JSONDictionary {
        
        var  dict: JSONDictionary = [:]
        
        if let applicationID = applicationID { dict[kApplication_id] = applicationID as AnyObject?  }
        if let userID = userID { dict[KUser_id] = userID as AnyObject? }
        if let stepCompleted = stepCompleted { dict[kAPP_StepComplete] = stepCompleted as AnyObject?  }
        if let isPending = isPending { dict[kAPP_IsPending] = isPending as AnyObject?  }
        
        return dict
    }
    
    func toSavePendingApp() {
        
        UserDefaults.standard.set(self.toJsonDict(), forKey: kPENDINGAPPLICATION)
        
    }
        
}
