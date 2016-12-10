//
//  RagisterViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class RagisterViewController: BaseViewController
{
    
    @IBOutlet var txtFirstName: AITextFieldSquare!
    @IBOutlet var txtLastName: AITextFieldSquare!
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var txtPassword: AITextFieldSquare!
    @IBOutlet var txtConfirmPassword: AITextFieldSquare!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.registerStaticText()
        // Do any additional setup after loading the view.
        self.doSetUpScreen()
    }
    
    func registerStaticText() {
            txtEmail.text = "aris.infotech99@gmail.com"
            txtPassword.text = "1234567"
            txtLastName.text = "Infotech"
            txtFirstName.text = "Aris"
            txtConfirmPassword.text = "1234567"
    }
    
    func doSetUpScreen()  {
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.txtType = .Email
        txtEmail.textFieldValidationType = .Email
        // txtEmail.delegate = self
        
        
        txtFirstName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtFirstName.txtType = .Name_NOSPACE
        
        txtLastName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtLastName.txtType = .Name_NOSPACE
        
        //txtPassword.delegate = self
        txtPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtPassword.textFieldValidationType = .Password
        
        txtConfirmPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtConfirmPassword.textFieldValidationType = .Password
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        super.viewWillAppear(animated)
        self.showNavigationBar()
        self.view.window?.backgroundColor = UIColor.white
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        self.title = "REGISTER"
    }
    
    //MARK: Back Button Clieked
    
    @IBAction func btnBackClicked(_ sender: AnyObject) {
        popTo()
    }
    
    @IBAction func btnRegsterPress(sender: UIButton)
    {
        
        if  TextValidation.isValidate(textField: txtFirstName , validationType:.AI_VALIDATION_TYPE_FIRST_NAME) {
            
            if TextValidation.isValidate(textField: txtLastName, validationType: .AI_VALIDATION_TYPE_LAST_NAME) {
                
                if  TextValidation.isValidate(textField: txtEmail , validationType:.AI_VALIDATION_TYPE_EMAIL) {
                    
                    if TextValidation.isValidate(textField: txtPassword, validationType: .AI_VALIDATION_TYPE_PASSWORD) {
                        
                        if TextValidation.isValidate(textField: txtConfirmPassword, validationType: .AI_VALIDATION_TYPE_CONFIRMPASSWORD) {
                            
                            
                            if txtPassword.text == txtConfirmPassword.text {
                                
                                if Reachability.sharedInstance.isReachable() {
                                    
                                    showHUD()
                                    let user = Register()
                                    user.first_name = txtFirstName.text!
                                    user.last_name = txtLastName.text!
                                    user.email = txtEmail.text!
                                    user.os_type = "iOS"
                                    user.password = txtPassword.text!
                                    user.push_token = deviceTokenString
                                    user.device_id = deviceID
                                    
                                    APIManager.sharedInstance.RegisterUser(user: user, completion: { (registeredUser:Register?, error:NSError?) in
                                        
                                        hideHUD()
                                        
                                        if error == nil {
                                            self.popTo()
                                        }
                                        
                                        
                                    })
                                }
                                
                            } else {
                                Alert.displayErrorDevMessage(str: "Password does not match.")
                            }
                        
                        }
                    }
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
