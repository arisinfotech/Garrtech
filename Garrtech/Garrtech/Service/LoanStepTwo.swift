//
//  LoanStepTwo.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class LoanStepTwo {
    
    var user_id: String?
    var application_id: String?
    var submit_type: String?
    var avg_monthly_card_sale: String?
    var total_monthly_sale: String?
    var annual_gross_sale: String?
    var desired_funding_amount: String?
    var use_of_funds: String?
    var is_advance_balance: String?
    var held_with: String?
    var advance_balance: String?
    
    func toJsonDictionary() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let application_id = application_id { dict[kApplication_id] = application_id as AnyObject? }
        if let submit_type = submit_type { dict[kSubmit_type] = submit_type as AnyObject? }
        if let avg_monthly_card_sale = avg_monthly_card_sale { dict[kStep2avg_monthly_card_sale] = avg_monthly_card_sale as AnyObject? }
        if let total_monthly_sale = total_monthly_sale { dict[kStep2total_monthly_sale] = total_monthly_sale as AnyObject? }
        if let annual_gross_sale = annual_gross_sale { dict[kStep2annual_gross_sale] = annual_gross_sale as AnyObject? }
        if let desired_funding_amount = desired_funding_amount { dict[kStep2desired_funding_amount] = desired_funding_amount as AnyObject? }
        if let use_of_funds = use_of_funds { dict[kStep2use_of_funds] = use_of_funds as AnyObject? }
        if let is_advance_balance = is_advance_balance { dict[kStep2is_advance_balance] = is_advance_balance as AnyObject? }
        if let held_with = held_with { dict[kStep2held_with] = held_with as AnyObject? }
        if let advance_balance = advance_balance { dict[kStep2advance_balance] = advance_balance as AnyObject? }
        
        return dict
    }
    
}
