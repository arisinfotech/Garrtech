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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.doSetUpScreen()
    }

    func doSetUpScreen() {
        
        self.title = "COMPANY INFORMATION"
  //      view_Upper.setDefaultBottomShadow()
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
