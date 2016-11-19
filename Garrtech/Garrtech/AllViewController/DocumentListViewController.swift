//
//  DocumentListViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class DocumentListViewController: BaseViewController {

    enum Document {
        case dTextReport
        case dDriverLicense
        case d6BackStatements
        case d6CraditCardStatemensts
        case dProofOfOwnership
        case dLanclordLeaseContract
        case dComVoidCheck
        case dMort
    }
    
   /// @IBOutlet var view_Upper: UIView! = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSetUpScreen()

    }
    func doSetUpScreen() {
        
        self.navigationItem.title = "DOCUMENT LIST"
   //     view_Upper.setDefaultBottomShadow()
        
    }
   
    @IBAction func btnSelectDocument(button: UIButton) {
        
        if button.isSelected {
            button.isSelected = false
        } else {
            button.isSelected = true
        }
        
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

   
}
