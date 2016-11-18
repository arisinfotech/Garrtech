//
//  BaseViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 18/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //  self.doSetUpScreen()
        
        self.setAppearanceOfNavigationBar(navCont: self.navigationController!)
        self.view.backgroundColor = UIColor.Color_AppBackground()
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
