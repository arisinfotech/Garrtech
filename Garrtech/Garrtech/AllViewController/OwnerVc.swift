//
//  OwnerVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class OwnerVc: BaseViewController,UIScrollViewDelegate,UITextFieldDelegate {
    
    
    var loanStep3 = LoanStepThree()
    
    @IBOutlet var txtName: AITextFieldSquare!
    @IBOutlet var txtTitle: AITextFieldSquare!
    @IBOutlet var txtStreetNumber: AITextFieldSquare!
    @IBOutlet var txtStreenName: AITextFieldSquare!
    @IBOutlet var txtAptSuit: AITextFieldSquare!
    @IBOutlet var txtCity: AITextFieldSquare!
    @IBOutlet var txtState: AITextFieldSquare!
    @IBOutlet var txtZipCode: AITextFieldSquare!
    @IBOutlet var txtHomePhone: AITextFieldSquare!
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var txtMobileNumber: AITextFieldSquare!
    @IBOutlet var txtDOB: AITextFieldSquare!
    @IBOutlet var txtSocialInsurance: AITextFieldSquare!
    @IBOutlet var txtStateProvince: AITextFieldSquare!
    @IBOutlet var txtPercentage: AITextFieldSquare!
    @IBOutlet var txtDrivingLicenceNumber: AITextFieldSquare!
    
    var drop_Percentage: UIDropDown!
    var array_Percentage : NSArray!
    
    @IBOutlet var obj_ScrollView: UIScrollView!
    var array1 = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doSetUpScreen()
        
    }

    // MARK: - ALL FUNCTIONS
    
    func doSetUpScreen() {
        
        self.title = "OWNER PRINCIPAL INFORMATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
//        let tapGeature = UITapGestureRecognizer.init(target: self, action: #selector(self.selectImageFromPhotoLibrary(_:)))
//        self.obj_ScrollView.addGestureRecognizer(tapGeature)
//        self.obj_ScrollView.isUserInteractionEnabled = true
        
        
        obj_ScrollView.delegate = self
        txtPercentage.delegate = self
        
        
        if self.array1.count > 0 {
            self.array1.removeAll()
        }
        
        DispatchQueue.main.async
        {
            
            
            for i in 1...100 {
                self.array1.append("\(i) %")
            }
            
            
            self.AddDropDown(sender: self.txtPercentage,array_Data: self.array1)
        }
        
        
        // SET UP TEXTFILED VALIDATION
        txtName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtName.textFieldValidationType = .Name
        
        txtTitle.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtTitle.textFieldValidationType = .Text
        
        txtStreenName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtStreenName.textFieldValidationType = .Text
        
        txtStreetNumber.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtStreetNumber.textFieldValidationType = .Text_Number
        
        txtAptSuit.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtAptSuit.textFieldValidationType = .Text
        
        txtCity.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtCity.textFieldValidationType = .Text
        
        txtCity.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtCity.textFieldValidationType = .Text
        
        txtState.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtState.textFieldValidationType = .Text
        
        txtZipCode.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtZipCode.textFieldValidationType = .Number
        
        txtHomePhone.setUpTextFieldForLengthValidation(minLength: 10, maxLength: 12)
        txtHomePhone.textFieldValidationType = .Number
        
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.textFieldValidationType = .Email
        
        txtMobileNumber.setUpTextFieldForLengthValidation(minLength: 10, maxLength: 10)
        txtMobileNumber.textFieldValidationType = .Number
        
        txtDOB.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtDOB.textFieldValidationType = .BirthDate
        
        txtSocialInsurance.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtSocialInsurance.textFieldValidationType = .Text_Number
        
        txtPercentage.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtPercentage.textFieldValidationType = .Text
        
        txtDrivingLicenceNumber.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtDrivingLicenceNumber.textFieldValidationType = .Text_Number
        
        txtStateProvince.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtStateProvince.textFieldValidationType = .Text
        
        loanStep3.k_how_fast_need = "48 Hours"
        loanStep3.k_how_long_pay_back  = "90 Days"
        
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        
        let object1:Bool = drop_Percentage.resign()
        object1
        
    }
   
    func AddDropDown(sender: UITextField!,array_Data:[String])
    {
        
        drop_Percentage = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_Percentage.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        drop_Percentage.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        
        //Default,Bouncing,Classic
        drop_Percentage.options = array_Data
        drop_Percentage.didSelect { (option, index) in
            sender.text=option;
            sender.textColor=UIColor.clear
            print(option)
        }
        
        self.obj_ScrollView.addSubview(drop_Percentage)
    }
    
    // MARK:- AllActions
    
    @IBAction func btn_NectClick(_ sender: AnyObject) {
    
        
        if OwnerTextValidation.isValidate(textField: txtName, validationType: .AI_VALIDATION_TYPE_NAME) {
       
            if OwnerTextValidation.isValidate(textField: txtTitle, validationType: .AI_VALIDATION_TYPE_TITLE) {
        
                if OwnerTextValidation.isValidate(textField: txtTitle, validationType: .AI_VALIDATION_TYPE_TITLE) {
                    
                    if OwnerTextValidation.isValidate(textField: txtPercentage, validationType: .AI_VALIDATION_PERCENTANGE) {
                        
                        if OwnerTextValidation.isValidate(textField: txtStreetNumber, validationType: .AI_VALIDATION_STREET_NUMBER) {
                            
                            if OwnerTextValidation.isValidate(textField: txtName, validationType: .AI_VALIDATION_STREET_NAME) {
                                
                                if OwnerTextValidation.isValidate(textField: txtAptSuit, validationType: .AI_VALIDATION_APT_SUIT) {
                                    
                                    if OwnerTextValidation.isValidate(textField: txtCity, validationType: .AI_VALIDATION_CITY) {
                                        
                                        if OwnerTextValidation.isValidate(textField: txtState, validationType: .AI_VALIDATION_STATE) {
                                            
                                            if OwnerTextValidation.isValidate(textField: txtZipCode, validationType: .AI_VALIDATION_ZIPCODE) {
                                                
                                                if OwnerTextValidation.isValidate(textField: txtHomePhone, validationType: .AI_VALIDATION_HOMEPHONE) {
                                                    
                                                    if OwnerTextValidation.isValidate(textField: txtMobileNumber, validationType: .AI_VALIDATION_MOBILE_NUMBER) {
                                                        
                                                        if OwnerTextValidation.isValidate(textField: txtEmail, validationType: .AI_VALIDATION_OWNER_EMAIL) {
                                                            
                                                            
                                                            if OwnerTextValidation.isValidate(textField: txtDOB, validationType: .AI_VALIDATION_DOB) {
                                                                
                                                                
                                                                    if OwnerTextValidation.isValidate(textField: txtSocialInsurance, validationType: .AI_VALIDATION_SOCIAL_INSURANCE) {
                                                                        
                                                                        if OwnerTextValidation.isValidate(textField: txtStateProvince, validationType: .AI_VALIDATION_SATATE_PROVINCE) {
                                                                            
                                                                            if OwnerTextValidation.isValidate(textField: txtDrivingLicenceNumber, validationType: .AI_VALIDATION_DRIVING_NUMBER) {
                                                                           
                                                                                if !Reachability.sharedInstance.isReachable() {
                                                                                    return
                                                                                }
                                                                                
                                                                                self.call_LoanStepThreeApi()
                                                                                
                                                                                
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
    func call_LoanStepThreeApi() {
    
        
        loanStep3.k_user_id = CurrentUser.sharedInstance.id!
        
        loanStep3.k_submit_type = "next"
        loanStep3.k_owner_name = txtName.text!
        loanStep3.k_owner_title = txtTitle.text!
        loanStep3.k_percentage_of_ownership = txtPercentage.text!
        
        loanStep3.k_zip = txtZipCode.text!
        loanStep3.k_Street_Number = txtStreetNumber.text!
        loanStep3.k_Street_Name = txtStreenName.text!
        loanStep3.k_street_Apt = txtAptSuit.text!
        loanStep3.k_State = txtState.text!
        loanStep3.k_City = txtCity.text!
        
        loanStep3.k_home_phone = txtHomePhone.text!
        loanStep3.k_home_mobile_number = txtMobileNumber.text!
        loanStep3.k_owner_email = txtEmail.text!
        loanStep3.k_owner_dob = txtDOB.text!
        loanStep3.k_social_security_insurance = txtSocialInsurance.text!
        loanStep3.k_drivers_licence_states = txtStateProvince.text!
        loanStep3.k_drivers_licenceNumber = txtDrivingLicenceNumber.text!
        
        if let str = UserDefaults.standard.value(forKey: kApplication_id) as? String {
            loanStep3.k_application_id = str
            APIManager.sharedInstance.loanStepThree(stepThree: loanStep3) { (error:NSError?) in
                let documentVC = self.storyboard?.instantiateViewController(withIdentifier: "DocumentListViewController") as! DocumentListViewController
                self.navigationController?.pushViewController(documentVC, animated: true)
            }
        } else {
            Alert.displayErrorDevMessage(str: "Application id is required")
        }
        
    }
    func moveToDocumentListScreen()  {
        
        pushTo(viewController: "DocumentListViewController")
        
    }
    @IBAction func btn_SelectNeed(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        
        let strArr = sender.titleLabel?.text?.characters.split{$0 == " "}.map(String.init)
        let value = strArr?[0]
        loanStep3.k_how_fast_need = "\(value)"
        
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        
    }
    @IBAction func btn_SelectPayback(_ sender: UIButton) {
        
        let viewTmp = sender.superview! as UIView
        for view in viewTmp.subviews as [UIView] {
            
            if let btn = view as? UIButton {
                btn.setImage(UIImage(named: "radiooff"), for: .normal)
            }
        }
        let strArr = sender.titleLabel?.text?.characters.split{$0 == " "}.map(String.init)
        let value = strArr?[0]
        loanStep3.k_how_long_pay_back  = "\(value)"
        
        sender.setImage(UIImage(named: "radioon"), for: .normal)
        
    }


    
    
    // MARK:-  textfieldDelget
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let object1:Bool = drop_Percentage.resign()
        print(object1)
        
        if textField == txtPercentage {
            return false
        }
        return true
    }
    
    // MARK:- scrollviewDeleget
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let object1:Bool = drop_Percentage.resign()
        object1
    }
    
    // MARK - AllActions
    @IBAction func btnNextPress(_ sender: AnyObject) {
        
        
        loanStep3.k_user_id = CurrentUser.sharedInstance.id!
        loanStep3.k_application_id = "1"
        loanStep3.k_owner_name = txtName.text!
        loanStep3.k_owner_title = txtTitle.text!
        loanStep3.k_percentage_of_ownership = txtPercentage.text!
        
        loanStep3.k_home_phone = txtHomePhone.text!
        loanStep3.k_home_mobile_number = txtMobileNumber.text!
        loanStep3.k_owner_email = txtEmail.text!
        loanStep3.k_owner_dob = txtDOB.text!
        loanStep3.k_social_security_insurance = txtSocialInsurance.text!
        loanStep3.k_drivers_licence_states = txtStateProvince.text!
                
        APIManager.sharedInstance.loanStepThree(stepThree: loanStep3) { (error:NSError?) in
            let documentVC = self.storyboard?.instantiateViewController(withIdentifier: "DocumentListViewController") as! DocumentListViewController
            self.navigationController?.pushViewController(documentVC, animated: true)
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
