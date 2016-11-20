//
//  LoanStepThree.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepThree {
    
    var user_id: String?
    var application_id: String?
    var submit_type: String?
    var owner_name: String?
    var owner_title: String?
    var percentage_of_ownership: String?
    var home_address: String?
    var home_phone: String?
    var home_mobile_number: String?
    var owner_email: String?
    var owner_dob: String?
    var social_security_insurance: String?
    var drivers_licence: String?
    var drivers_licence_states: String?
    var how_fast_need: String?
    var how_long_pay_back: String?
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
    
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        
        if let application_id = application_id { dict[kApplication_id] = application_id as AnyObject? }
        
        if let submit_type = submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        
        if let owner_name = owner_name { dict[kStep3owner_name] = owner_name as AnyObject? }
        
        if let owner_title = owner_title { dict[kStep3owner_title] = owner_title as AnyObject? }
        
        if let percentage_of_ownership = percentage_of_ownership { dict[kStep3percentage_of_ownership] = percentage_of_ownership as AnyObject? }
        
        if let home_address = home_address { dict[kStep3home_address] = home_address as AnyObject? }
        
        if let home_phone = home_phone { dict[kStep3home_phone] = home_phone as AnyObject? }
        
        if let home_mobile_number = home_mobile_number { dict[kStep3home_mobile_number] = home_mobile_number as AnyObject? }
        
        if let owner_email = owner_email { dict[kStep3owner_email] = owner_email as AnyObject? }
        
        if let owner_dob = owner_dob { dict[kStep3owner_dob] = owner_dob as AnyObject? }
        
        if let social_security_insurance = social_security_insurance { dict[kStep3social_security_insurance] = social_security_insurance as AnyObject? }
        
        if let drivers_licence = drivers_licence { dict[kStep3drivers_licence] = drivers_licence as AnyObject? }
        
        if let drivers_licence_states = drivers_licence_states { dict[kStep3drivers_licence_states] = drivers_licence_states as AnyObject? }
        
        if let how_fast_need = how_fast_need { dict[kStep3how_fast_need] = how_fast_need as AnyObject? }
        
        if let how_long_pay_back = how_long_pay_back { dict[kStep3how_long_pay_back] = how_long_pay_back as AnyObject? }
        
        return dict
        
    }
}

class LoanStepFour {
    
    var user_id: String?
    var application_id: String?
    var submit_type: String?
    var document_list: String?
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let application_id = application_id { dict[kApplication_id] = application_id as AnyObject? }
        if let submit_type = submit_type { dict[kSubmit_type] = submit_type  as AnyObject? }
        if let document_list = document_list { dict[kStep4document_list] = document_list as AnyObject? }
        
        return dict
        
    }
    
}
