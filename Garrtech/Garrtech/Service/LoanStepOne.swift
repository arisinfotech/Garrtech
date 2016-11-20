//
//  LoanStepOne.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepOne {
 
    var user_id: String?
    var submit_type: String?
    var application_id: String?
    var legal_business_name: String?
    var dba_name: String?
    var legal_entity: String?
    var date_business_eslablished: String?
    var business_classification: String?
    var physical_address: String?
    var mailing_address: String?
    var business_phone: String?
    var business_fax: String?
    var business_mobile: String?
    var business_email: String?
    var business_website: String?
    var business_tax_number: String?
    var terminal_model: String?
    var property_ownership: String?
    var years_in_control: String?
    var months_in_control: String?
    var product_sold: String?
    var landlord_company_name: String?
    var landlord_contact_name: String?
    var landlord_contact_number: String?
    var rent_payment: String?
    var bankruptcy_protection: String?
    var tax_liens_agains_business: String?
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let submit_type = submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        if let application_id = application_id { dict[kApplication_id] = application_id as AnyObject? }
        if let legal_business_name = legal_business_name { dict[kStep1Legal_business_name] = legal_business_name as AnyObject? }
        if let dba_name = dba_name { dict[kstep1Dba_name] = dba_name as AnyObject? }
        if let legal_entity = legal_entity { dict[kStep1legal_entity] = legal_entity as AnyObject? }
        if let date_business_eslablished = date_business_eslablished { dict[kStep1Date_business_eslablished] = date_business_eslablished as AnyObject? }
        if let business_classification = business_classification { dict[kStep1Business_classification] = business_classification as AnyObject? }
        if let physical_address = physical_address { dict[kStep1Physical_address] = physical_address as AnyObject? }
        if let mailing_address = mailing_address { dict[kStep1Mailing_address] = mailing_address as AnyObject? }
        if let business_phone = business_phone { dict[kStep1Business_phone] = business_phone as AnyObject? }
        if let business_fax = business_fax { dict[kStep1Business_fax] = business_fax as AnyObject? }
        if let business_mobile = business_mobile { dict[kStep1Business_mobile] = business_mobile as AnyObject? }
        if let business_email = business_email { dict[kStep1Business_email] = business_email as AnyObject? }
        if let business_website = business_website { dict[kStep1business_website] = business_website as AnyObject? }
        if let business_tax_number = business_tax_number { dict[kStep1business_tax_number] = business_tax_number as AnyObject? }
        if let terminal_model = terminal_model { dict[kStep1Terminal_model] = terminal_model as AnyObject? }
        if let property_ownership = property_ownership { dict[kStep1property_ownership] = property_ownership as AnyObject? }
        if let years_in_control = years_in_control { dict[kStep1years_in_control] = years_in_control as AnyObject? }
        if let months_in_control = months_in_control { dict[kStep1months_in_control] = months_in_control as AnyObject? }
        if let product_sold = product_sold { dict[kStep1Product_sold] = product_sold as AnyObject? }
        if let landlord_company_name = landlord_company_name { dict[kStep1Landlord_company_name] = landlord_company_name as AnyObject? }
        if let landlord_contact_name = landlord_contact_name { dict[kStep1Landlord_contact_name] = landlord_contact_name as AnyObject? }
        if let landlord_contact_number = landlord_contact_number { dict[kStep1Landlord_contact_number] = landlord_contact_number as AnyObject? }
        if let rent_payment = rent_payment { dict[kStep1rent_payment] = rent_payment as AnyObject? }
        if let bankruptcy_protection = bankruptcy_protection { dict[kStep1Bankruptcy_protection] = bankruptcy_protection as AnyObject? }
        if let tax_liens_agains_business = tax_liens_agains_business { dict[kStep1tax_liens_agains_business] = tax_liens_agains_business as AnyObject?}
        
        return dict
        
    }
    
    
}
