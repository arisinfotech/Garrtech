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
    
    @IBOutlet weak var txtAvgMothnlyCardSales: AITextFieldSquare!
    @IBOutlet var txtTtlMonthlySales: AITextFieldSquare!
    @IBOutlet var txtAnnualGrossSales: AITextFieldSquare!
    @IBOutlet var txtDesireFundingAmount: AITextFieldSquare!
    @IBOutlet var txtUserOfFunds: AITextFieldSquare!
    @IBOutlet var txtBalanceIfYes: AITextFieldSquare!
    @IBOutlet var txtHeldWith: AITextFieldSquare!
    
    
    var isNext: Bool = false
    var stepTwo = LoanStepTwo()
    var stepTwoGet = LoanStepTwo()
    var balanceType = String()
    
    
    @IBOutlet var btnYES: UIButton!
    @IBOutlet var btnNO: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if isNext != true {
            if CurrentUser.sharedInstance.pendingApp?.isPending == "Y" {
                
                APIManager.sharedInstance.getStepTwoData(appID: (CurrentUser.sharedInstance.pendingApp?.applicationID)!, stepId: "2", completion: { (loanData:LoanStepTwo?, error:NSError?) in
                    
                    if error == nil {
                        self.setFillData(loanData: loanData!)
                        self.stepTwoGet.k_application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
                    }
                })
            } else {
                balanceType="Y"
            }
        } else {
            balanceType="Y"
        }
        
        self.doSetUpScreen()
    }
    
    func setFillData(loanData: LoanStepTwo) {
        
        stepTwo.k_user_id = CurrentUser.sharedInstance.id!
        stepTwo.k_application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
        txtAvgMothnlyCardSales.text = loanData.k_avg_monthly_card_sale
        txtTtlMonthlySales.text = loanData.k_total_monthly_sale
        txtAnnualGrossSales.text = loanData.k_annual_gross_sale
        txtDesireFundingAmount.text = loanData.k_desired_funding_amount
        txtUserOfFunds.text = loanData.k_use_of_funds
        txtHeldWith.text = loanData.k_held_with
        balanceType = loanData.k_is_advance_balance!
        
        
        if balanceType == "N"
        {
            btnYES.setImage(UIImage(named: "radiooff"), for: .normal)
            btnNO.setImage(UIImage(named: "radioon"), for: .normal)
        }
        else
        {
            btnYES.setImage(UIImage(named: "radioon"), for: .normal)
            btnNO.setImage(UIImage(named: "radiooff"), for: .normal)
        }
        
        if balanceType == "N"
        {
            txtBalanceIfYes.isUserInteractionEnabled = false
            stepTwo.k_advance_balance = ""
            stepTwo.k_is_advance_balance = balanceType
            txtBalanceIfYes.layer.borderColor = UIColor.RGB(R: 219, G: 219, B: 219, A: 1).cgColor
        } else {
            txtBalanceIfYes.text = loanData.k_advance_balance
            txtBalanceIfYes.isUserInteractionEnabled = true
            balanceType = "Y"

        }
        
    }

    func doSetUpScreen() {
        
        self.title = "COMPANY INFORMATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        self.setRightSideButtonWithImage(Name: "home.png", selector:  #selector(self.popToRoot))
        
        
        txtAvgMothnlyCardSales.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtAvgMothnlyCardSales.textFieldValidationType = .Number
        
        txtTtlMonthlySales.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtTtlMonthlySales.textFieldValidationType = .Number
        
        txtAnnualGrossSales.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtAnnualGrossSales.textFieldValidationType = .Number
        
        txtDesireFundingAmount.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtDesireFundingAmount.textFieldValidationType = .Number
        
        txtUserOfFunds.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtUserOfFunds.textFieldValidationType = .Text
        
        txtBalanceIfYes.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtBalanceIfYes.textFieldValidationType = .Number
        
        txtHeldWith.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 35)
        txtHeldWith.textFieldValidationType = .Text
        
    }
   
    // MARK: - All Actions
    
    @IBAction func btn_NextClick(sender: UIButton)
    {
        
        self.dismissKeyboard()
        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        
        
        if sender.tag == 1 {
            self.saveSecondStep(saveType: sender.tag)
            return
        } else {
            stepTwo.k_submit_type = "next"
        }
        
        
        if CompanyTextValidation.isValidate(textField: txtAvgMothnlyCardSales, validationType: .AI_VALIDATION_TYPE_AVG_MONTHALY_SALES)
        {
            if CompanyTextValidation.isValidate(textField: txtTtlMonthlySales, validationType: .AI_VALIDATION_TYPE_TOTAL_MONTHALY_SALES)
            {
                
                if CompanyTextValidation.isValidate(textField: txtAnnualGrossSales, validationType: .AI_VALIDATION_TYPE_ANNUAL_GROSS_SALES)
                {
                    
                    if CompanyTextValidation.isValidate(textField: txtDesireFundingAmount, validationType: .AI_VALIDATION_TYPE_DESIRE_FUNDING_AMMOUNT)
                    {
                     
                        if CompanyTextValidation.isValidate(textField: txtUserOfFunds, validationType: .AI_VALIDATION_TYPE_USE_OF_FUNDS)
                        {
                            
                            if balanceType == "N" || (CompanyTextValidation.isValidate(textField: txtBalanceIfYes,  validationType: .AI_VALIDATION_TYPE_BALANCE_IF_YES))

                            {
                                if CompanyTextValidation.isValidate(textField: txtHeldWith, validationType: .AI_VALIDATION_TYPE_TOTAL_HELD_WIDTH)
                                {
                                    
                                    self.saveSecondStep(saveType: sender.tag)
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func saveSecondStep(saveType: Int)  {
        
        stepTwo.k_user_id = CurrentUser.sharedInstance.id!
//        stepTwo.k_submit_type = "next"
        stepTwo.k_application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
        stepTwo.k_avg_monthly_card_sale = txtAvgMothnlyCardSales.text!
        stepTwo.k_total_monthly_sale = txtTtlMonthlySales.text!
        stepTwo.k_annual_gross_sale = txtAnnualGrossSales.text!
        stepTwo.k_desired_funding_amount = txtDesireFundingAmount.text!
        stepTwo.k_use_of_funds = txtUserOfFunds.text!
        
        stepTwo.k_held_with = txtHeldWith.text!
        
        if balanceType=="Y"
        {
            stepTwo.k_advance_balance = txtBalanceIfYes.text!
            stepTwo.k_is_advance_balance = balanceType
        }
        else
        {
            stepTwo.k_advance_balance = ""
            stepTwo.k_is_advance_balance = balanceType
        }
        
        print(stepTwo.toJsonDictionary())
        print(UserDefaults.standard.value(forKey: kApplication_id))


        APIManager.sharedInstance.loanStepTwo(stepTwo: stepTwo) { (error: NSError?) in
            if error == nil {
                
                if saveType == 1 {
                    self.popToRoot()
                } else {
                    let ownerVC = self.storyboard?.instantiateViewController(withIdentifier: "OwnerVc") as! OwnerVc
                    ownerVC.isNext = true
                    self.navigationController?.pushViewController(ownerVC, animated: true)
                }
            }
        }
    }
    

    
    
    @IBAction func btnNextPress(_ sender: AnyObject) {
        
        stepTwo.k_user_id = CurrentUser.sharedInstance.id!
        stepTwo.k_application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
        stepTwo.k_avg_monthly_card_sale = txtAvgMothnlyCardSales.text!
        stepTwo.k_total_monthly_sale = txtTtlMonthlySales.text!
        stepTwo.k_annual_gross_sale = txtAnnualGrossSales.text!
        stepTwo.k_desired_funding_amount = txtDesireFundingAmount.text!
        stepTwo.k_use_of_funds = txtUserOfFunds.text!
        
        stepTwo.k_held_with = txtHeldWith.text!
        
        if balanceType=="Y"
        {
            stepTwo.k_advance_balance = txtBalanceIfYes.text!
            stepTwo.k_is_advance_balance = balanceType
        }
        else
        {
            stepTwo.k_advance_balance = ""
            stepTwo.k_is_advance_balance = balanceType
        }
        
        
        APIManager.sharedInstance.loanStepTwo(stepTwo: stepTwo) { (error: NSError?) in
            
            if error == nil {
                let ownerVC = self.storyboard?.instantiateViewController(withIdentifier: "") as! OwnerVc
                self.navigationController?.pushViewController(ownerVC, animated: true)
            }
            
        }
        
    }
    @IBAction func btn_SelectLoan(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        
        if sender.titleLabel?.text?.whiteSpaceTrimmedString()=="Yes"
        {
            balanceType="Y"
            txtBalanceIfYes.isUserInteractionEnabled = true
            txtBalanceIfYes.layer.borderColor = UIColor.Color_LightGray().cgColor
            txtBalanceIfYes.becomeFirstResponder()
        }
        else
        {
            balanceType="N"
            txtBalanceIfYes.isUserInteractionEnabled = false
            txtBalanceIfYes.layer.borderColor = UIColor.RGB(R: 219, G: 219, B: 219, A: 1).cgColor
            self.view.endEditing(true)
            txtBalanceIfYes.text = ""
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
