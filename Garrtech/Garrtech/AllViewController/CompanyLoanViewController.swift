//
//  CompanyLoanViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class CompanyLoanViewController: BaseViewController {

//    @IBOutlet var view_Upper: UIView! = UIView()
    
    @IBOutlet weak var txtAvgMothnlyCardSales: AITextFieldSquare!
    @IBOutlet var txtTtlMonthlySales: AITextFieldSquare!
    @IBOutlet var txtAnnualGrossSales: AITextFieldSquare!
    @IBOutlet var txtDesireFundingAmount: AITextFieldSquare!
    @IBOutlet var txtUserOfFunds: AITextFieldSquare!
    @IBOutlet var txtBalanceIfYes: AITextFieldSquare!
    @IBOutlet var txtHeldWith: AITextFieldSquare!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.doSetUpScreen()
    }

    func doSetUpScreen() {
        
        self.title = "COMPANY INFORMATION"
  //      view_Upper.setDefaultBottomShadow()
        
    }
    
    @IBAction func btnNextPress(_ sender: AnyObject) {
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
