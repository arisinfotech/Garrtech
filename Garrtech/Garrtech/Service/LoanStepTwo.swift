//
//  LoanStepTwo.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepTwo {
    
    var k_user_id: String?
    var k_application_id: String?
    var k_submit_type: String?
    var k_avg_monthly_card_sale: String?
    var k_total_monthly_sale: String?
    var k_annual_gross_sale: String?
    var k_desired_funding_amount: String?
    var k_use_of_funds: String?
    var k_is_advance_balance: String?
    var k_held_with: String?
    var k_advance_balance: String?
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = k_user_id { dict[KUser_id] = user_id as AnyObject? }
        if let application_id = k_application_id { dict[kApplication_id] = application_id as AnyObject? }
        if let submit_type = k_submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        if let avg_monthly_card_sale = k_avg_monthly_card_sale { dict[kStep2avg_monthly_card_sale] = avg_monthly_card_sale as AnyObject? }
        if let total_monthly_sale = k_total_monthly_sale { dict[kStep2total_monthly_sale] = total_monthly_sale as AnyObject? }
        if let annual_gross_sale = k_annual_gross_sale { dict[kStep2annual_gross_sale] = annual_gross_sale as AnyObject? }
        if let desired_funding_amount = k_desired_funding_amount { dict[kStep2desired_funding_amount] = desired_funding_amount as AnyObject? }
        if let use_of_funds = k_use_of_funds { dict[kStep2use_of_funds] = use_of_funds as AnyObject? }
        if let is_advance_balance = k_is_advance_balance { dict[kStep2is_advance_balance] = is_advance_balance as AnyObject? }
        if let held_with = k_held_with { dict[kStep2held_with] = held_with as AnyObject? }
        if let advance_balance = k_advance_balance { dict[kStep2advance_balance] = advance_balance as AnyObject? }
        
        return dict
    }
    
}
