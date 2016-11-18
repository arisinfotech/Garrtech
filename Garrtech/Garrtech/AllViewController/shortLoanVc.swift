//
//  shortLoanVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class shortLoanVc: UIViewController {

    @IBOutlet var lblHeadTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        self.doSetUpScreen()
    }
    func doSetUpScreen() {
        
        self.title = "BUSINESS INFORMATION"
        lblHeadTitle.text=" Find out what you can borrow \n in second "
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
