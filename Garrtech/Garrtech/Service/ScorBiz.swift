//
//  ScorBiz.swift
//  Garrtech
//
//  Created by Ankit on 25/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import Foundation

class ScorBiz {
    
    
    var annualRevenue: ScorBizDetail?
    var businessTime: ScorBizDetail?
    var craditScrore: ScorBizDetail?
    var totalMonthlySale: ScorBizDetail?
    var propertyOwnerShip: ScorBizDetail?
    
    func populateWithJson(dict: JSONDictionary) {
        
        if let annualRevenue = dict[kAnnual_revenue] as? JSONDictionary {
            let annualRevenuTemo = ScorBizDetail()
            annualRevenuTemo.populateWithJSON(dict: annualRevenue)
            self.businessTime = annualRevenuTemo
        }
        
        if let businessTime = dict[kBusiness_time] as? JSONDictionary {
            let annualRevenuTemo = ScorBizDetail()
            annualRevenuTemo.populateWithJSON(dict: businessTime)
            self.annualRevenue = annualRevenuTemo
        }
        
        if let totalMonthlySale = dict[kCreadit_score] as? JSONDictionary {
            let annualRevenuTemo = ScorBizDetail()
            annualRevenuTemo.populateWithJSON(dict: totalMonthlySale)
            self.craditScrore = annualRevenuTemo
        }
        
        if let propertyOwnerShip = dict[kStep2total_monthly_sale] as? JSONDictionary {
            let annualRevenuTemo = ScorBizDetail()
            annualRevenuTemo.populateWithJSON(dict: propertyOwnerShip)
            self.totalMonthlySale = annualRevenuTemo
        }

        if let propertyOwnerShip = dict[kStep1property_ownership] as? JSONDictionary {
            let annualRevenuTemo = ScorBizDetail()
            annualRevenuTemo.populateWithJSON(dict: propertyOwnerShip)
            self.propertyOwnerShip = annualRevenuTemo
        }

    }
    
    /*
     {
     "status": "1",
     "message": "Scorebiz Data.",
     "data": {
     "annual_revenue": {
     "taken_score": "2",
     "disp_name": "Less than $50,000",
     "total_sore": "20"
     },
     "business_time": {
     "taken_score": "2",
     "disp_name": "0 - 6 months",
     "total_sore": "10"
     },
     "creadit_score": {
     "taken_score": "12",
     "disp_name": "Good(660-720)",
     "total_sore": "30"
     },
     "total_monthly_sale": {
     "disp_name": "12312",
     "total_sore": "20",
     "taken_score": "10"
     },
     "property_ownership": {
     "disp_name": "own",
     "total_sore": "20",
     "taken_score": "20"
     }
     }
     }
     */
}

class ScorBizDetail {
    var displayName: String?
    var totalScore: String?
    var takenScore: String?
    
    func populateWithJSON(dict: JSONDictionary) {
        
        if let displayName = dict[kDisp_Name] as? String {
            self.displayName = displayName
        }
        
        if let totalScore = dict[kTotal_sore] as? String {
            self.totalScore = totalScore
        }
        
        if let takenScore = dict[kTaken_score] as? String {
            self.takenScore = takenScore
        }
        
    }
}
