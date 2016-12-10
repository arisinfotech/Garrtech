//
//  ChangePasswordViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    
    
    @IBOutlet var txtOldPassword: AITextFieldSquare!
    @IBOutlet var txtNewPassword: AITextFieldSquare!
    @IBOutlet var txtComfirmPassword: AITextFieldSquare!
    @IBOutlet var btnChangePassword: UIButton!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.doSetUpScreen()
    }
    override func viewWillAppear(_ animated: Bool)
    {
       // self.showNavigationBar()
        super.viewWillAppear(animated)
        
    }
    // MARK: - ALL FUNCTIONS
    
    func doSetUpScreen() {
        
        self.title = "CHANGE PASSWORD"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        
        txtOldPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtOldPassword.textFieldValidationType = .Password
        
        txtNewPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtNewPassword.textFieldValidationType = .Password
        
        txtComfirmPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtComfirmPassword.textFieldValidationType = .Password

    }

    func call_ChangePasswordAPI() {
        
        let password = ChangePassword()
        password.user_id = CurrentUser.sharedInstance.id!
        password.old_password = txtOldPassword.text
        password.new_password = txtNewPassword.text
        password.confirm_password = txtComfirmPassword.text
        
        
        
        APIManager.sharedInstance.ChangePassword(password: password) { (error:NSError?) in
            
            if error == nil
            {
                self.popTo()
            }
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: AITextFieldSquare) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - ALL ACTIONS
    
    @IBAction func changePassPress(sender: UIButton) {
        
        
        if TextValidation.isValidate(textField: txtOldPassword, validationType: .AI_VALIDATION_TYPE_OLDPASSWORD)
        {
            if TextValidation.isValidate(textField: txtNewPassword, validationType: .AI_VALIDATION_TYPE_NEWPASSWORD)
            {
                if TextValidation.isValidate(textField: txtComfirmPassword, validationType: .AI_VALIDATION_TYPE_CONFIRMPASSWORD)
                {
                    if txtNewPassword.text == txtComfirmPassword.text
                    {
                        
                        if Reachability.sharedInstance.isReachable() {
                                self.call_ChangePasswordAPI()
                        }
                    }else{
                    
                        Alert.displayAlertWithMessage(message: message_ConfirmPassword_NotMatch, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: { (index) in
                            
                        })
         
                    }
                }
            }
            
        }
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
