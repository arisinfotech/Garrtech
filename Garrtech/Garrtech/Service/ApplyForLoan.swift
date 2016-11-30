//
//  ApplyForLoan.swift
//  Garrtech
//
//  Created by Ankit on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation


class ApplyForLoan {
    
    var user_id: String?
    var required_loan_amount: String?
    var business_time: String?
    var annual_revenue: String?
    var credit_score: String?
    var invoice_business_customers: String?
    
    
    func toJsonDict() -> JSONDictionary {
        
        var dict: JSONDictionary = [:]
        
        if let user_id = user_id { dict[KUser_id] = user_id as AnyObject? }
        if let required_loan_amount = required_loan_amount { dict[kRequired_loan_amount] = required_loan_amount as AnyObject? }
        if let business_time = business_time { dict[kBusiness_time] = business_time as AnyObject? }
        if let annual_revenue = annual_revenue { dict[kannual_revenue] = annual_revenue as AnyObject? }
        if let credit_score = credit_score { dict[kcredit_score] = credit_score as AnyObject? }
        if let invoice_business_customers = invoice_business_customers { dict[kInvoice_business_customers] = invoice_business_customers as AnyObject? }
        
        return dict
        
    }
    
}

class LoanDetails {
    
    /*
     "id": "1",
     "loan_title": "test1",
     "loan_desc": "desc",
     "required_loan_amount": "10000",
     "business_time": "2",
     "annual_revenue": "20000",
     "credit_score": "5",
     "invoice_business_customers": "Y"
     */
    
    var kid: String?
    var kloanTitle: String?
    var kloanDes: String?
    var krequiredLoanAmount: String?
    var kbusinessTime: String?
    var kannualRevenue: String?
    var kcraditScore: String?
    var kinvoiceBusinessCustomer: String?
    
    var kprofitability_required: String?
    var ksec_pos_allowed: String?
    var kcc_volume_factor: String?
    var kbankruptcy_allowed: String?
    var kac_rec_factor: String?
    
    
    func populateWithJson(dict: JSONDictionary) {
        
        if let id = dict[kID] as? String {
            self.kid = id
        }
        
        if let loanTitle = dict[kLoan_title] as? String {
            self.kloanTitle = loanTitle
        }
        
        if let loanDes = dict[kLoan_desc] as? String {
            self.kloanDes = loanDes
        }
        
        if let requiredLoanAmount = dict[kRequired_loan_amount] as? String {
            self.krequiredLoanAmount = requiredLoanAmount
        }
        
        if let businessTime = dict[kBusiness_time] as? String {
            self.kbusinessTime = businessTime
        }
        
        if let annualRevenue = dict[kannual_revenue] as? String {
            self.kannualRevenue = annualRevenue
        }
        
        if let craditScore = dict[kcredit_score] as? String {
            self.kcraditScore = craditScore
        }
        
        if let Invoice_business_customers = dict[kInvoice_business_customers] as? String
        {
            self.kinvoiceBusinessCustomer = Invoice_business_customers
        }
        
        if let profitability_required = dict[profitability_required] as? String {
            self.kprofitability_required = profitability_required
        }
        if let sec_pos_allowed = dict[sec_pos_allowed] as? String {
            self.ksec_pos_allowed = sec_pos_allowed
        }
        
        if let cc_volume_factor = dict[cc_volume_factor] as? String {
            self.kcc_volume_factor = cc_volume_factor
        }
        
        if let bankruptcy_allowed = dict[bankruptcy_allowed] as? String {
            self.kbankruptcy_allowed = bankruptcy_allowed
        }
        
        if let ac_rec_factor = dict[ac_rec_factor] as? String {
            self.kac_rec_factor = ac_rec_factor
        }
    }
}
