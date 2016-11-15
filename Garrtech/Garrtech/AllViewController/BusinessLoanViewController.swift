//
//  BusinessLoanViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class BusinessLoanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "BUSINESS INFORMATION"
        
        let viewCompleteTask = CompletedStepView(nibName: "CompletedStepView", bundle: nil)
        viewCompleteTask.view.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 120)
        self.view.addSubview(viewCompleteTask.view)

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
