//
//  BusinessLoanViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

let txtMax_Length: NSInteger = 50

class BusinessLoanViewController: BaseViewController,UITextFieldDelegate,UIScrollViewDelegate {
    
    @IBOutlet var txt_Retail: AITextFieldSquare!
    var drop_Retail: UIDropDown!
    var array1 : NSArray!
    
    @IBOutlet var obj_ScrollView: UIScrollView!
    
    var LegalEntity = String()
    var PropertyOwner = String()
    var bankruptcy = String()
    var Principal = String()
    
    
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
    @IBOutlet var txtProductSold: AITextFieldSquare!
    
    @IBOutlet var txtWebSite: AITextFieldSquare!
    @IBOutlet var txtMailState: AITextFieldSquare!
    var BusinessLoan = LoanStepOne()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        LegalEntity = "Crop"
        PropertyOwner = "Lease"
        Principal = "Y"
        bankruptcy = "Y"
        
        self.doSetUpScreen()
        
    }
    
    // MARK:- allFunction
    
    func doSetUpScreen() {
        
        self.title = "BUSINESS INFORMATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        obj_ScrollView.delegate = self
        txt_Retail.delegate = self
        
        DispatchQueue.main.async {
            self.array1 = ["Retail", "Restaurant", "Services", "Manufacturer/Wholesaler", "Internet", "Mail Order/Telephone Order"]
            self.AddDropDown(sender: self.txt_Retail,array_Data: self.array1)
            self.BusinessLoan.k_business_classification = self.array1[0] as? String
        }
        
        
        txtDate.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtDate.textFieldValidationType = .Date
        
        
        txtBusinessName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtBusinessName.textFieldValidationType = .Name
        
        txtDbaName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtDbaName.textFieldValidationType = .Text
        
        txtPhyStreetNumber.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyStreetNumber.textFieldValidationType = .Text_Number
        
        txtPhyStreetName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyStreetName.textFieldValidationType = .Text
        
        
        txtPhyAptSuit.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyAptSuit.textFieldValidationType = .Text
        
        txtPhyCity.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyCity.textFieldValidationType = .Text
        
        txtPhyState.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyState.textFieldValidationType = .Text
        
        txtPhyZipCode.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtPhyZipCode.textFieldValidationType = .Number
        
        txtMailStreenNo.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMailStreenNo.textFieldValidationType = .Text_Number
        
        txtMailStreetName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMailStreetName.textFieldValidationType = .Text
        
        txtMailApiSuite.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMailApiSuite.textFieldValidationType = .Text
        
        txtMailCity.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMailCity.textFieldValidationType = .Text
        
        txtMailZipCode.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMailZipCode.textFieldValidationType = .Number
        
        txtPhone.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 15)
        txtPhone.textFieldValidationType = .Number
        
        txtFax.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 15)
        txtFax.textFieldValidationType = .Number
        
        txtMobile.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 10)
        txtMobile.textFieldValidationType = .Phone
        
        txtEmailAddress.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtEmailAddress.textFieldValidationType = .Email
        
        txtTaxIDNumberOrBusinessNumber.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtTaxIDNumberOrBusinessNumber.textFieldValidationType = .Text
        
        txtTerminalPosMakeModel.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtTerminalPosMakeModel.textFieldValidationType = .Text
        
        txtYearsInControl.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtYearsInControl.textFieldValidationType = .Number
        
        txtMonthInControl.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtMonthInControl.textFieldValidationType = .Number
        
        txtLandlordMortgageCompanyName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtLandlordMortgageCompanyName.textFieldValidationType = .Text
        
        txtLandlordContactName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtLandlordContactName.textFieldValidationType = .Text
        
        txtLandlordMortgageCompanyPhone.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtLandlordMortgageCompanyPhone.textFieldValidationType = .Phone
        
        txtRentMortgagePayment.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtRentMortgagePayment.textFieldValidationType = .Number
        
        txtProductSold.setUpTextFieldForLengthValidation(minLength: 1, maxLength: txtMax_Length)
        txtProductSold.textFieldValidationType = .Text
        
        
    }
    
    
    func AddDropDown(sender: UITextField!,array_Data:NSArray)
    {
        
        drop_Retail = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_Retail.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //  drop_Retail.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        self.txt_Retail.text = self.array1[0] as? String
        
        //Default,Bouncing,Classic
        drop_Retail.options = array_Data as! [String]
        drop_Retail.didSelect { (option, index) in
            
            self.BusinessLoan.k_business_classification = self.array1[index] as? String
            
            sender.text=option;
            sender.textColor=UIColor.clear
            print(option)
        }
        
        self.obj_ScrollView.addSubview(drop_Retail)
    }
    
    // MARK:- AllActions
    
    @IBAction func btn_NextClick() {
        
        if BusinessTextValidation.isValidate(textField: txtBusinessName, validationType: .AI_VALIDATION_TYPE_BUSINESS_NAME) {
            if BusinessTextValidation.isValidate(textField: txtDbaName, validationType: .AI_VALIDATION_TYPE_DBA_NAME) {
                if BusinessTextValidation.isValidate(textField: txtDate, validationType: .AI_VALIDATION_TYPE_DATE_ESTABLISHED) {
                    if BusinessTextValidation.isValidate(textField: txtPhyStreetNumber, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NUMBER) {
                        if BusinessTextValidation.isValidate(textField: txtPhyStreetName, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NAME) {
                            if BusinessTextValidation.isValidate(textField: txtPhyAptSuit, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_API_SUIT_UNIT) {
                                if BusinessTextValidation.isValidate(textField: txtPhyCity, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_CITY) {
                                    if BusinessTextValidation.isValidate(textField: txtPhyState, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_STATE) {
                                        if BusinessTextValidation.isValidate(textField: txtPhyZipCode, validationType: .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_ZIPCODE) {
                                            if BusinessTextValidation.isValidate(textField: txtMailStreenNo, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NUMBER) {
                                                if BusinessTextValidation.isValidate(textField: txtMailStreetName, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NAME) {
                                                    if BusinessTextValidation.isValidate(textField: txtMailApiSuite, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_API_SUIT_UNIT) {
                                                        if BusinessTextValidation.isValidate(textField: txtMailCity, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_CITY) {
                                                            if BusinessTextValidation.isValidate(textField: txtMailState, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_STATE) {
                                                                if BusinessTextValidation.isValidate(textField: txtMailZipCode, validationType: .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_ZIPCODE) {
                                                                    if BusinessTextValidation.isValidate(textField: txtPhone, validationType: .AI_VALIDATION_TYPE_BUSINESS_PHONE_NUMBER) {
                                                                        if BusinessTextValidation.isValidate(textField: txtFax, validationType: .AI_VALIDATION_TYPE_BUSINESS_FAX_NUMBER) {
                                                                            if BusinessTextValidation.isValidate(textField: txtMobile, validationType: .AI_VALIDATION_TYPE_BUSINESS_MOBILE_NUMBER) {
                                                                                if BusinessTextValidation.isValidate(textField: txtEmailAddress, validationType: .AI_VALIDATION_TYPE_BUSINESS_EMAIL_NUMBER) {
                                                                                    if BusinessTextValidation.isValidate(textField: txtWebSite, validationType: .AI_VALIDATION_TYPE_BUSINESS_WEBSITE_NUMBER) {
                                                                                        if BusinessTextValidation.isValidate(textField: txtTaxIDNumberOrBusinessNumber, validationType: .AI_VALIDATION_TYPE_BUSINESS_TAX_TD_NUMBER_OR_BUSINESS_NUMBER) {
                                                                                            if BusinessTextValidation.isValidate(textField: txtTerminalPosMakeModel, validationType: .AI_VALIDATION_TYPE_BUSINESS_TERMINAL_POS_MAKE_MODEL_NUMBER) {
                                                                                                if BusinessTextValidation.isValidate(textField: txtYearsInControl, validationType: .AI_VALIDATION_TYPE_BUSINESS_YEARS_IN_CONTROL) {
                                                                                                    if BusinessTextValidation.isValidate(textField: txtMonthInControl, validationType: .AI_VALIDATION_TYPE_BUSINESS_MONTH_IN_CONTROL) {
                                                                                                        if BusinessTextValidation.isValidate(textField: txtProductSold, validationType: .AI_VALIDATION_TYPE_BUSINESS_PRODUCT_SOLD) {
                                                                                                            if BusinessTextValidation.isValidate(textField: txtLandlordMortgageCompanyName, validationType: .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_NAME) {
                                                                                                                if BusinessTextValidation.isValidate(textField: txtLandlordContactName, validationType: .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COTACT_NAME) {
                                                                                                                    if BusinessTextValidation.isValidate(textField: txtLandlordMortgageCompanyPhone, validationType: .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_PHONE) {
                                                                                                                        if BusinessTextValidation.isValidate(textField: txtRentMortgagePayment, validationType: .AI_VALIDATION_TYPE_BUSINESS_RENT_MORTGAGE_PAYMENT) {
                                                                                                                            
                                                                                                                            if !Reachability.sharedInstance.isReachable() {
                                                                                                                                return
                                                                                                                            }
                                                                                                                            self.valicationComplete()
                                                                                                                        }
                                                                                                                        
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func valicationComplete() {
        BusinessLoan.k_kuser_id = CurrentUser.sharedInstance.id
        BusinessLoan.k_StepOne_loan_type_id = "1"
        BusinessLoan.k_submit_type = "next"
        
        
        
        BusinessLoan.k_legal_business_name = txtBusinessName.text
        BusinessLoan.k_dba_name = txtDbaName.text
        BusinessLoan.k_legal_entity = LegalEntity
        BusinessLoan.k_date_business_eslablished = txtDate.text
        BusinessLoan.k_business_classification = txt_Retail.text
        
        //Physical Address
        
        BusinessLoan.k_phy_street_num = txtPhyStreetNumber.text
        BusinessLoan.k_phy_street_name = txtPhyStreetName.text
        BusinessLoan.k_phy_apt = txtPhyAptSuit.text
        BusinessLoan.k_phy_city = txtPhyCity.text
        BusinessLoan.k_phy_state = txtPhyState.text
        BusinessLoan.k_phy_zip = txtPhyZipCode.text
        
        // Mailing Address
        
        BusinessLoan.k_mail_street_num = txtMailStreenNo.text
        BusinessLoan.k_mail_street_name = txtMailStreetName.text
        BusinessLoan.k_mail_apt = txtMailApiSuite.text
        BusinessLoan.k_mail_city = txtMailCity.text
        BusinessLoan.k_mail_state = txtMailState.text
        BusinessLoan.k_mail_zip = txtMailZipCode.text
        
        
        // Business Address
        
        BusinessLoan.k_business_phone = txtPhone.text
        BusinessLoan.k_business_fax = txtFax.text
        BusinessLoan.k_business_mobile = txtMobile.text
        BusinessLoan.k_business_email = txtEmailAddress.text
        BusinessLoan.k_business_website = txtWebSite.text
        BusinessLoan.k_business_tax_number = txtTaxIDNumberOrBusinessNumber.text
        BusinessLoan.k_terminal_model = txtTerminalPosMakeModel.text
        
        BusinessLoan.k_property_ownership = PropertyOwner
        BusinessLoan.k_years_in_control = txtYearsInControl.text
        BusinessLoan.k_months_in_control = txtMonthInControl.text
        BusinessLoan.k_product_sold = txtProductSold.text
        BusinessLoan.k_landlord_company_name = txtLandlordMortgageCompanyName.text
        BusinessLoan.k_landlord_contact_name = txtLandlordContactName.text
        BusinessLoan.k_landlord_contact_number = txtLandlordMortgageCompanyPhone.text
        BusinessLoan.k_rent_payment = txtRentMortgagePayment.text
        BusinessLoan.k_bankruptcy_protection = bankruptcy
        BusinessLoan.k_tax_liens_agains_business = Principal
        
        APIManager.sharedInstance.loanStepOne(stepOne: BusinessLoan) { (error:NSError?) in
            
            
            if error == nil
            {
                print(error)
                self.moveToComanyLoanScreen()
            }
            else
            {
                print("Success")
            }
        }
        
    }
    
    @IBAction func sameAsabovePress(sender: UIButton) {
        
        txtMailCity.text = txtPhyCity.text
        txtMailState.text = txtPhyState.text
        txtMailZipCode.text = txtPhyZipCode.text
        txtMailApiSuite.text = txtPhyAptSuit.text
        txtMailStreetName.text = txtPhyStreetName.text
        txtMailStreenNo.text = txtPhyStreetNumber.text
        
    }
    
    
    func moveToComanyLoanScreen() {
        
        pushTo(viewController: "CompanyLoanViewController")
        
    }
    
    
    @IBAction func btn_SelectLegalEntity(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        LegalEntity=(sender.titleLabel?.text)!
        print(LegalEntity)
        
    }
    @IBAction func btn_SelectProperty(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        PropertyOwner=(sender.titleLabel?.text)!
        
    }
    @IBAction func btn_PendingPrincipal(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        if sender.titleLabel?.text?.whiteSpaceTrimmedString() == "Yes"
        {
            Principal = "Y"
        }
        else
        {
            Principal = "N"
        }
        
    }
    @IBAction func btn_Business(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        if sender.titleLabel?.text?.whiteSpaceTrimmedString() == "Yes"
        {
            bankruptcy = "Y"
        }
        else
        {
            bankruptcy = "N"
        }
    }
    
    // MARK:-  textfieldDelget
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let object1:Bool = drop_Retail.resign()
        print(object1)
        
        if textField == txt_Retail {
            return false
        }
        return true
    }
    
    // MARK:- scrollviewDeleget
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let object1:Bool = drop_Retail.resign()
        object1
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
