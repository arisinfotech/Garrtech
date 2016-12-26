//
//  DocumentListViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit


let ktax_report = "tax_report"
let kdriver_licence = "driver_licence"
let kback_statement = "back_statement"
let kcredit_crd_statement = "credit_crd_statement"
let kprove_ownership = "prove_ownership"
let klandlord_lease_cotract = "landlord_lease_cotract"
let kcompany_void_check = "company_void_check"
let kmortage_statement_balance = "mortage_statement_balance"

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
    var isNext: Bool! = false
    @IBOutlet var scrollObj: UIScrollView!
    var strArr = [String]()
   /// @IBOutlet var view_Upper: UIView! = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNext != true {
            if CurrentUser.sharedInstance.pendingApp?.isPending == "Y" {
                
                APIManager.sharedInstance.getStepFourData(appID: (CurrentUser.sharedInstance.pendingApp?.applicationID)!, stepId: "4", completion: { (loanData:LoanStepFour?, error:NSError?) in

                    if error == nil {
                        self.setFillData(loanData: loanData!)
                        self.stepFour.application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
                    }
                })
            }
        }
        
        self.doSetUpScreen()
    }
    
    func setFillData(loanData: LoanStepFour) {
        
        let strDoc = loanData.document_list
        
        if (strDoc?.characters.count)! > 0 {
            strArr = (strDoc?.components(separatedBy: CharacterSet.init(charactersIn: ",")))!
        }
        
        
        self.IDARR = strArr
        print(strArr)
        stepFour.document_list = self.IDARR.joined(separator: ",")
        
        
        for str in self.IDARR {
            
            for viewObj in self.scrollObj.subviews as [UIView] {
                if viewObj.tag == 5 {
                    print(viewObj.restorationIdentifier!)
                    print(str)
                    if viewObj.restorationIdentifier! == str {
                        for view in viewObj.subviews as [UIView] {
                            if let btn = view as? UIButton {
                                btn.isSelected = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    func doSetUpScreen() {
        self.title = "DOCUMENT LIST"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.btnBackClick))
        self.setRightSideButtonWithImage(Name: "home.png", selector:  #selector(self.popToRoot))
        
    }
    func btnBackClick() {
        popTo()
    }
   
    @IBAction func btnSelectDocument(button: UIButton) {
        
        var text = ""
        let viewTmp = button.superview! as UIView
        
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UILabel {
                text = viewTmp.restorationIdentifier!
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
        print(stepFour.document_list)
    }
    
    @IBAction func btn_NectClick(_ sender: AnyObject) {
        
        let btn = sender as! UIButton

        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        
        if self.IDARR.count == 0
        {
            Alert.displayAlertWithMessage(message: "Please select atleast one document", otherButtonTitles: nil, preferredAlertStyle: UIAlertControllerStyle.alert, withCompletion: nil)
        }
        else
        {
            
            if btn.tag == 1 {
                
            } else {
                stepFour.submit_type = "next"
            }
            
            stepFour.user_id = CurrentUser.sharedInstance.id
            
            stepFour.application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
            APIManager.sharedInstance.loanStepFour(stepFour: stepFour) { (error:NSError?) in
                if error == nil {
                    if btn.tag == 1 {
                        self.popToRoot()
                    } else {
                        self.messageViewScreen()
                    }
                }
            }
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
