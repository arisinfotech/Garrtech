//
//  BusinessLoanViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class BusinessLoanViewController: BaseViewController,UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet var txt_Retail: AITextFieldSquare!
    var drop_Retail: UIDropDown!
    var array1 : NSArray!
  
    @IBOutlet var obj_ScrollView: UIScrollView!
    
    
    @IBOutlet var txtBusinessName: AITextFieldSquare!
    @IBOutlet var txtDbaName: AITextFieldSquare!
    @IBOutlet var txtDate: AITextFieldSquare!
    
    @IBOutlet var txtPhyStreetNumber: AITextFieldSquare!
    @IBOutlet var txtPhyStreetName: AITextFieldSquare!
    @IBOutlet var txtPhyAptSuit: AITextFieldSquare!
    @IBOutlet var txtPhyCity: AITextFieldSquare!
    @IBOutlet var txtPhyState: AITextFieldSquare!
    @IBOutlet var txtPhyZipCode: AITextFieldSquare!
    @IBOutlet var txtMailStreenNo: AITextFieldSquare!
    @IBOutlet var txtMailStreetName: AITextFieldSquare!
    @IBOutlet var txtMailApiSuite: AITextFieldSquare!
    @IBOutlet var txtMailCity: AITextFieldSquare!
    @IBOutlet var txtMailZipCode: AITextFieldSquare!
    @IBOutlet var txtPhone: AITextFieldSquare!
    @IBOutlet var txtFax: AITextFieldSquare!
    @IBOutlet var txtMobile: AITextFieldSquare!
    @IBOutlet var txtEmailAddress: AITextFieldSquare!
    @IBOutlet var txtTaxIDNumberOrBusinessNumber: AITextFieldSquare!
    @IBOutlet var txtTerminalPosMakeModel: AITextFieldSquare!
    @IBOutlet var txtYearsInControl: AITextFieldSquare!
    @IBOutlet var txtMonthInControl: AITextFieldSquare!
    @IBOutlet var txtLandlordMortgageCompanyName: AITextFieldSquare!
    @IBOutlet var txtLandlordContactName: AITextFieldSquare!
    @IBOutlet var txtLandlordMortgageCompanyPhone: AITextFieldSquare!
    @IBOutlet var txtRentMortgagePayment: AITextFieldSquare!
    
    @IBOutlet var txtWebSite: AITextFieldSquare!
    @IBOutlet var txtMailState: AITextFieldSquare!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSetUpScreen()
        
    }
   
    // MARK - allFunction
  
    func doSetUpScreen() {
       
        self.title = "BUSINESS INFORMATION"
        obj_ScrollView.delegate = self
        txt_Retail.delegate = self
        
        DispatchQueue.main.async
            {
       
                self.array1 = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
                self.AddDropDown(sender: self.txt_Retail,array_Data: self.array1)
            }
        
    }
    
    func AddDropDown(sender: UITextField!,array_Data:NSArray)
    {
        
        drop_Retail = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_Retail.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        drop_Retail.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        
        //Default,Bouncing,Classic
        drop_Retail.options = array_Data as! [String]
        drop_Retail.didSelect { (option, index) in
            sender.text=option;
            sender.textColor=UIColor.clear
            print(option)
        }
        
        self.obj_ScrollView.addSubview(drop_Retail)
    }
    
    // MARK - AllActions
    
    
    
    // MARK -  textfieldDelget
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let object1:Bool = drop_Retail.resign()
        print(object1)
        
        if textField == txt_Retail {
            return false
        }
        return true
    }
   
    // MARK - scrollviewDeleget
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let object1:Bool = drop_Retail.resign()
        print(object1)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
