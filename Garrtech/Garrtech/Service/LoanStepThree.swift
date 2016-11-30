//
//  LoanStepThree.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepThree {
    
    var k_user_id: String?
    var k_application_id: String?
    var k_submit_type: String?
    var k_owner_name: String?
    var k_owner_title: String?
    var k_percentage_of_ownership: String?
    var k_home_address: String?
    var k_Street_Name: String?
    var k_Street_Number: String?
    var k_street_Apt: String?
    var k_City: String?
    var k_State: String?
    var k_zip: String?
    var k_home_phone: String?
    var k_home_mobile_number: String?
    var k_owner_email: String?
    var k_owner_dob: String?
    var k_social_security_insurance: String?
    var k_drivers_licenceNumber: String?
    var k_drivers_licence_states: String?
    var k_how_fast_need: String?
    var k_how_long_pay_back: String?
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = k_user_id { dict[KUser_id] = user_id as AnyObject? }
        
        if let application_id = k_application_id { dict[kApplication_id] = application_id as AnyObject? }
        
        if let submit_type = k_submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        
        if let owner_name = k_owner_name { dict[kStep3owner_name] = owner_name as AnyObject? }
        
        if let owner_title = k_owner_title { dict[kStep3owner_title] = owner_title as AnyObject? }
        
        if let percentage_of_ownership = k_percentage_of_ownership { dict[kStep3percentage_of_ownership] = percentage_of_ownership as AnyObject? }
        
        //if let home_address = k_home_address { dict[kStep3home_address] = home_address as AnyObject? }
        
        if let Street_Name = k_Street_Name { dict[kStep3add_street_name] = Street_Name as AnyObject? }
        
        if let Street_Number = k_Street_Number { dict[kStep3add_street_num] = Street_Number as AnyObject? }
        
        if let street_Apt = k_street_Apt { dict[kStep3add_apt] = street_Apt as AnyObject? }
        
        if let City = k_City { dict[kStep3add_city] = City as AnyObject? }
        
        if let State = k_State { dict[kStep3add_state] = State as AnyObject? }
        
        if let zip = k_zip { dict[kStep3add_zip] = zip as AnyObject? }
        
        if let home_phone = k_home_phone { dict[kStep3home_phone] = home_phone as AnyObject? }
        
        if let home_mobile_number = k_home_mobile_number { dict[kStep3home_mobile_number] = home_mobile_number as AnyObject? }
        
        if let owner_email = k_owner_email { dict[kStep3owner_email] = owner_email as AnyObject? }
        
        if let owner_dob = k_owner_dob { dict[kStep3owner_dob] = owner_dob as AnyObject? }
        
        if let social_security_insurance = k_social_security_insurance { dict[kStep3social_security_insurance] = social_security_insurance as AnyObject? }
        
        if let drivers_licence = k_drivers_licenceNumber { dict[kStep3drivers_licence] = drivers_licence as AnyObject? }
        
        if let drivers_licence_states = k_drivers_licence_states { dict[kStep3drivers_licence_states] = drivers_licence_states as AnyObject? }
        
        if let how_fast_need = k_how_fast_need { dict[kStep3how_fast_need] = how_fast_need as AnyObject? }
        
        if let how_long_pay_back = k_how_long_pay_back { dict[kStep3how_long_pay_back] = how_long_pay_back as AnyObject? }
        
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
