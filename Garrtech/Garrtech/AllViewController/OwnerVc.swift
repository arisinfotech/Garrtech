//
//  OwnerVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class OwnerVc: BaseViewController {

    @IBOutlet var view_Upper: UIView! = UIView()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doSetUpScreen()
        
    }
    
    func doSetUpScreen() {
        
        self.title = "OWNER PRINCIPAL INFORMATION"
        view_Upper.setDefaultBottomShadow()
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
