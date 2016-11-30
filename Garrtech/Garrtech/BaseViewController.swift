//
//  BaseViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 18/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet var constrain_Space: NSLayoutConstraint!
    @IBOutlet var view_Upper: UIView! = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()
        
        self.setAppearanceOfNavigationBar(navCont: self.navigationController!)
        self.view.backgroundColor = UIColor.Color_AppBackground()

    }
    
    func setUpView() {
        
        view_Upper.setDefaultBottomShadow()

        
        if IS_IPAD_DEVICE() {
            constrain_Space?.constant = 30
        } else{
            constrain_Space?.constant = 10
        }
            
        
    }
 

    
}
