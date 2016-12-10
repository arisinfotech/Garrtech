//
//  MyApplication.swift
//  Garrtech
//
//  Created by Ankit on 04/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class MyApplication {
    

    
    var id: String?
    var stepComplete: String?
    var isPending: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var profile: String?
    var loanTitle: String?
    var loanName: String?
    
    
    
    func populateWithJson(dict: JSONDictionary) {
        
        if let id = dict[kID] as? String {
            self.id = id
        }
        if let stepComplete = dict[kCompletedStep] as? String {
            self.stepComplete = stepComplete
        }
        if let isPending = dict[kAPP_IsPending] as? String {
            self.isPending = isPending
        }
        if let firstName = dict[kfirst_name] as? String {
            self.firstName = firstName
        }
        if let lastName = dict[klast_name] as? String {
            self.lastName = lastName
        }
        if let email = dict[kEmail] as? String {
            self.email = email
        }
        if let profile = dict[kUser_avatar] as? String {
            self.profile = profile
        }
        if let loanTitle = dict[kLoan_title] as? String {
            self.loanTitle = loanTitle
        }
        if let loanName = dict[kStep1Legal_business_name] as? String {
            self.loanName = loanName
        }
        
        
    }
    
}
