//
//  LoanOptions.swift
//  Garrtech
//
//  Created by Ankit on 20/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation


let kDisp_Name      = "disp_name"
let kMin_val        = "min_val"
let kMax_val        = "max_val"
let kType           = "type"
let kannual_revenue = "annual_revenue"
let kcredit_score   = "credit_score"
let kloan_amt_need  = "loan_amt_need"
let ktime_in_business = "time_in_business"

class LoanOptions {
 
    var id: String?
    var disp_name: String?
    var min_val: String?
    var max_val: String?
    var type: String?
    
    func populateWithJson(dic: JSONDictionary)  {
        
        if let id = dic[kID] as? String {
            self.id = id
        }
        
        if let disp_name = dic[kDisp_Name] as? String {
            self.disp_name = disp_name
        }
        
        if let min_val = dic[kMin_val] as? String? {
            self.min_val = min_val
        }
        
        if let max_val = dic[kMax_val] as? String? {
            self.max_val = max_val
        }
        
        if let type = dic[kType] as? String {
            self.type = type
        }

    }
    
}
