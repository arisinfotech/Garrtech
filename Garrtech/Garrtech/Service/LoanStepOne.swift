//
//  LoanStepOne.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepOne {
    
    var k_id: String?
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
    
    var k_annualRev: String?
    var k_bussiness_time: String?
    var k_creditScore: String?
    
    func populateWithJSON(dict: JSONDictionary) {

        
        if let k_annualRev = dict[kannual_revenue] as? String {
            self.k_annualRev = k_annualRev
        }
        
        if let k_bussiness_time = dict[kBusiness_time] as? String {
            self.k_bussiness_time = k_bussiness_time
        }
        
        if let k_creditScore = dict[kCredit_score] as? String {
            self.k_creditScore = k_creditScore
        }
        
        if let k_id = dict[kID] as? String {
            self.k_id = k_id
        }
        
        if let user_id = dict[KUser_id] as? String {
            self.k_kuser_id = user_id
        }
        
        if let loanTypeID = dict[KLone_id] as? String {
            self.k_StepOne_loan_type_id = loanTypeID
        }
        
        if let k_submit_type = dict[kSubmit_type] as? String{
            self.k_submit_type = k_submit_type
        }
        
      
        if let k_application_id = dict[kApplication_id] as? String{
            self.k_application_id = k_application_id
        }
        
        
        if let k_legal_business_name = dict[kStep1Legal_business_name] as? String{
            self.k_legal_business_name = k_legal_business_name
        }
        
        
        if let k_dba_name = dict[kstep1Dba_name] as? String{
            self.k_dba_name = k_dba_name
        }
        
        
        if let k_legal_entity = dict[kStep1legal_entity] as? String{
            self.k_legal_entity = k_legal_entity
        }
        
        
        if let k_date_business_eslablished = dict[kStep1Date_business_eslablished] as? String{
            self.k_date_business_eslablished = k_date_business_eslablished
        }
       
        
        if let k_business_classification = dict[kStep1Business_classification] as? String{
            self.k_business_classification = k_business_classification
        }
        
        
        if let k_physical_address = dict[kStep1Physical_address] as? String{
            self.k_physical_address = k_physical_address
        }
      
        
        if let k_mailing_address = dict[kStep1Mailing_address] as? String{
            self.k_mailing_address = k_mailing_address
        }
        
        if let k_business_phone = dict[kStep1Business_phone] as? String{
            self.k_business_phone = k_business_phone
        }
        
        
        if let k_business_fax = dict[kStep1Business_fax] as? String{
            self.k_business_fax = k_business_fax
        }
      
        
        if let k_business_mobile = dict[kStep1Business_mobile] as? String{
            self.k_business_mobile = k_business_mobile
        }
       
        
        if let k_business_email = dict[kStep1Business_email] as? String{
            self.k_business_email = k_business_email
        }
        
        
        if let k_business_website = dict[kStep1business_website] as? String{
            self.k_business_website = k_business_website
        }
        
        
        if let k_business_tax_number = dict[kStep1business_tax_number] as? String{
            self.k_business_tax_number = k_business_tax_number
        }
        
        
        if let k_terminal_model = dict[kStep1Terminal_model] as? String{
            self.k_terminal_model = k_terminal_model
        }
        
        
        if let k_property_ownership = dict[kStep1property_ownership] as? String{
            self.k_property_ownership = k_property_ownership
        }
        
        
        if let k_years_in_control = dict[kStep1years_in_control] as? String{
            self.k_years_in_control = k_years_in_control
        }
        
        
        if let k_months_in_control = dict[kStep1months_in_control] as? String{
            self.k_months_in_control = k_months_in_control
        }
       
        
        if let k_product_sold = dict[kStep1Product_sold] as? String{
            self.k_product_sold = k_product_sold
        }
       
        
        if let k_landlord_company_name = dict[kStep1Landlord_company_name] as? String{
            self.k_landlord_company_name = k_landlord_company_name
        }
       
        
        if let k_landlord_contact_name = dict[kStep1Landlord_contact_name] as? String{
            self.k_landlord_contact_name = k_landlord_contact_name
        }
        
        
        if let k_landlord_contact_number = dict[kStep1Landlord_contact_number] as? String{
            self.k_landlord_contact_number = k_landlord_contact_number
        }
       
        if let k_rent_payment = dict[kStep1rent_payment] as? String{
            self.k_rent_payment = k_rent_payment
        }
        
        
        if let k_bankruptcy_protection = dict[kStep1Bankruptcy_protection] as? String{
            self.k_bankruptcy_protection = k_bankruptcy_protection
        }
        
       
        if let k_tax_liens_agains_business = dict[kStep1tax_liens_agains_business] as? String{
            self.k_tax_liens_agains_business = k_tax_liens_agains_business
        }
       
        if let k_phy_street_num = dict[kStep1phy_street_num] as? String{
            self.k_phy_street_num = k_phy_street_num
        }
    
        if let k_phy_street_name = dict[kStep1phy_street_name] as? String{
            self.k_phy_street_name = k_phy_street_name
        }
        
        if let k_phy_apt = dict[kStep1phy_apt] as? String{
            self.k_phy_apt = k_phy_apt
        }
        
        if let k_phy_city = dict[kStep1phy_city] as? String{
            self.k_phy_city = k_phy_city
        }
        
        if let k_phy_state = dict[kStep1phy_state] as? String{
            self.k_phy_state = k_phy_state
        }
        
        if let k_phy_zip = dict[kStep1phy_zip] as? String{
            self.k_phy_zip = k_phy_zip
        }
        
        if let k_mail_street_num = dict[kStep1mail_street_num] as? String{
            self.k_mail_street_num = k_mail_street_num
        }
        
        if let k_mail_street_name = dict[kStep1mail_street_name] as? String{
            self.k_mail_street_name = k_mail_street_name
        }
        
        if let k_mail_apt = dict[kStep1mail_apt] as? String{
            self.k_mail_apt = k_mail_apt
        }
        
        if let k_mail_city = dict[kStep1mail_city] as? String{
            self.k_mail_city = k_mail_city
        }
        
        if let k_mail_state = dict[kStep1mail_state] as? String{
            self.k_mail_state = k_mail_state
        }
        
        if let k_mail_zip = dict[kStep1mail_zip] as? String{
            self.k_mail_zip = k_mail_zip
        }
    }
    
    
    
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
        
        if let annualRevObj = k_annualRev { dict[kannual_revenue] = annualRevObj as AnyObject? }
        if let bussiness_timeObj = k_bussiness_time { dict[kBusiness_time] = bussiness_timeObj as AnyObject? }
        if let Credit_scoreObj = k_creditScore { dict[kCredit_score] = Credit_scoreObj as AnyObject? }
        
        return dict
        
    }
    
    /*
     "id": "5",
     "application_id": "5",
     "user_id": "1",
     "legal_business_name": "business name1",
     "dba_name": "dba name1",
     "legal_entity": "legal entity",
     "date_business_eslablished": "2016-06-06",
     "business_classification": "12",
     "phy_street_num": "1 phy",
     "phy_street_name": "street nm phy",
     "phy_apt": "phy apt",
     "phy_city": "city phy",
     "phy_state": "state phy",
     "phy_zip": "zip phy",
     "mail_street_num": "street mail",
     "mail_street_name": "street name mail",
     "mail_apt": "mail apt",
     "mail_city": "city mail",
     "mail_state": "state mail",
     "mail_zip": "zip mail",
     "business_phone": "12345567",
     "business_fax": "23678687",
     "business_mobile": "344324",
     "business_email": "abc@gmail.com",
     "business_website": "abc@test.com",
     "business_tax_number": "1231",
     "terminal_model": "terminal model",
     "property_ownership": "property owner",
     "years_in_control": "2",
     "months_in_control": "1",
     "product_sold": "1111",
     "landlord_company_name": "sfhj'sdhii",
     "landlord_contact_name": "fniuaoi#
     ",
     "landlord_contact_number": "12432",
     "rent_payment": "34",
     "bankruptcy_protection": "2178764678",
     "tax_liens_agains_business": "fjjkjd"
     */
}
