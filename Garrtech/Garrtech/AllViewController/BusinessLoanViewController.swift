//
//  BusinessLoanViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class BusinessLoanViewController: BaseViewController {

   // @IBOutlet var constrain_Space: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSetUpScreen()
        
        // Do any additional setup after loading the view.
    }
   
    
    
    func doSetUpScreen() {
       
        self.title = "BUSINESS INFORMATION"
      
        
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
