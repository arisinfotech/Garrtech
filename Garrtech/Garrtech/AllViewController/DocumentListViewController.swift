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
    
    var IDARR = [String]()
    
    var stepFour = LoanStepFour()
    
   /// @IBOutlet var view_Upper: UIView! = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doSetUpScreen()
        
    }
    func doSetUpScreen() {
        self.title = "DOCUMENT LIST"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.btnBackClick))
        
    }
    func btnBackClick() {
        popTo()
    }
   
    @IBAction func btnSelectDocument(button: UIButton) {
        
        var text = ""
        let viewTmp = button.superview! as UIView
        
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UILabel {
                text = btn.text!
            }
        }
        
        if button.isSelected {
            
            button.isSelected = false
            if self.IDARR.contains(text) {
                if let index = self.IDARR.index(of: text) {
                    self.IDARR.remove(at: index)
                }
            }
        } else {
            button.isSelected = true
            self.IDARR.append(text)
        }
        
        stepFour.document_list = self.IDARR.joined(separator: ",")
    }
    
    @IBAction func btn_NectClick(_ sender: AnyObject) {
        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        

        stepFour.submit_type = "next"
        stepFour.user_id = CurrentUser.sharedInstance.id
        
        if let appID = UserDefaults.standard.object(forKey: kApplication_id) {
            stepFour.application_id = appID as? String
            APIManager.sharedInstance.loanStepFour(stepFour: stepFour) { (error:NSError?) in
                if error == nil {
                    self.messageViewScreen()
                }
            }
        } else {
            Alert.displayErrorDevMessage(str: "Application id is required")
        }

    }
    
    func messageViewScreen()  {
        
        pushTo(viewController: "MessageViewController")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

   
}
