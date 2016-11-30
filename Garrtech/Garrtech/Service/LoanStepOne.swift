//
//  LoanStepOne.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepOne {
    
    var k_kuser_id: String?
    var k_StepOne_loan_type_id: String?
    var k_submit_type: String?
    var k_application_id: String?
    var k_legal_business_name: String?
    var k_dba_name: String?
    var k_legal_entity: String?
    var k_date_business_eslablished: String?
    var k_business_classification: String?
    var k_physical_address: String?
    var k_mailing_address: String?
    var k_business_phone: String?
    var k_business_fax: String?
    var k_business_mobile: String?
    var k_business_email: String?
    var k_business_website: String?
    var k_business_tax_number: String?
    var k_terminal_model: String?
    var k_property_ownership: String?
    var k_years_in_control: String?
    var k_months_in_control: String?
    var k_product_sold: String?
    var k_landlord_company_name: String?
    var k_landlord_contact_name: String?
    var k_landlord_contact_number: String?
    var k_rent_payment: String?
    var k_bankruptcy_protection: String?
    var k_tax_liens_agains_business: String?
    
    var k_phy_street_num: String?
    var k_phy_street_name: String?
    var k_phy_apt: String?
    var k_phy_city: String?
    var k_phy_state: String?
    var k_phy_zip: String?
    var k_mail_street_num: String?
    var k_mail_street_name: String?
    var k_mail_apt: String?
    var k_mail_city: String?
    var k_mail_state: String?
    var k_mail_zip: String?
    
    
    
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = k_kuser_id { dict[KUser_id] = user_id as AnyObject? }
        if let user_id = k_StepOne_loan_type_id { dict[KLone_id] = user_id as AnyObject? }
        if let submit_type = k_submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        if let application_id = k_application_id { dict[kApplication_id] = application_id as AnyObject? }
        if let legal_business_name = k_legal_business_name { dict[kStep1Legal_business_name] = legal_business_name as AnyObject? }
        if let dba_name = k_dba_name { dict[kstep1Dba_name] = dba_name as AnyObject? }
        if let legal_entity = k_legal_entity { dict[kStep1legal_entity] = legal_entity as AnyObject? }
        if let date_business_eslablished = k_date_business_eslablished { dict[kStep1Date_business_eslablished] = date_business_eslablished as AnyObject? }
        if let business_classification = k_business_classification { dict[kStep1Business_classification] = business_classification as AnyObject? }
        if let physical_address = k_physical_address { dict[kStep1Physical_address] = physical_address as AnyObject? }
        if let mailing_address = k_mailing_address { dict[kStep1Mailing_address] = mailing_address as AnyObject? }
        if let business_phone = k_business_phone { dict[kStep1Business_phone] = business_phone as AnyObject? }
        if let business_fax = k_business_fax { dict[kStep1Business_fax] = business_fax as AnyObject? }
        if let business_mobile = k_business_mobile { dict[kStep1Business_mobile] = business_mobile as AnyObject? }
        if let business_email = k_business_email { dict[kStep1Business_email] = business_email as AnyObject? }
        if let business_website = k_business_website { dict[kStep1business_website] = business_website as AnyObject? }
        if let business_tax_number = k_business_tax_number { dict[kStep1business_tax_number] = business_tax_number as AnyObject? }
        if let terminal_model = k_terminal_model { dict[kStep1Terminal_model] = terminal_model as AnyObject? }
        if let property_ownership = k_property_ownership { dict[kStep1property_ownership] = property_ownership as AnyObject? }
        if let years_in_control = k_years_in_control { dict[kStep1years_in_control] = years_in_control as AnyObject? }
        if let months_in_control = k_months_in_control { dict[kStep1months_in_control] = months_in_control as AnyObject? }
        if let product_sold = k_product_sold { dict[kStep1Product_sold] = product_sold as AnyObject? }
        if let landlord_company_name = k_landlord_company_name { dict[kStep1Landlord_company_name] = landlord_company_name as AnyObject? }
        if let landlord_contact_name = k_landlord_contact_name { dict[kStep1Landlord_contact_name] = landlord_contact_name as AnyObject? }
        if let landlord_contact_number = k_landlord_contact_number { dict[kStep1Landlord_contact_number] = landlord_contact_number as AnyObject? }
        if let rent_payment = k_rent_payment { dict[kStep1rent_payment] = rent_payment as AnyObject? }
        if let bankruptcy_protection = k_bankruptcy_protection { dict[kStep1Bankruptcy_protection] = bankruptcy_protection as AnyObject? }
        if let tax_liens_agains_business = k_tax_liens_agains_business { dict[kStep1tax_liens_agains_business] = tax_liens_agains_business as AnyObject?}
        
        if let phy_street_num = k_phy_street_num { dict[kStep1phy_street_num] = phy_street_num as AnyObject? }
        if let phy_street_name = k_phy_street_name { dict[kStep1phy_street_name] = phy_street_name as AnyObject? }
        if let phy_apt = k_phy_apt { dict[kStep1phy_apt] = phy_apt as AnyObject? }
        if let phy_city = k_phy_city { dict[kStep1phy_city] = phy_city as AnyObject? }
        if let phy_state = k_phy_state { dict[kStep1phy_state] = phy_state as AnyObject? }
        if let phy_zip = k_phy_zip { dict[kStep1phy_zip] = phy_zip as AnyObject? }
        
        
        if let mail_street_num = k_mail_street_num { dict[kStep1mail_street_num] = mail_street_num as AnyObject? }
        if let mail_street_name = k_mail_street_name { dict[kStep1mail_street_name] = mail_street_name as AnyObject? }
        if let mail_apt = k_mail_apt { dict[kStep1mail_apt] = mail_apt as AnyObject? }
        if let mail_city = k_mail_city { dict[kStep1mail_city] = mail_city as AnyObject? }
        if let mail_state = k_mail_state { dict[kStep1mail_state] = mail_state as AnyObject? }
        if let mail_zip = k_mail_zip { dict[kStep1mail_zip] = mail_zip as AnyObject? }
        
        return dict
        
    }
    
    
}
