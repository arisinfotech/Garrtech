//
//  LoginViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController,CloseForgotPasswordScreenDelegate {
    
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var txtPassword: AITextFieldSquare!
    @IBOutlet var bottomConstraintOfloginButton: NSLayoutConstraint!
    @IBOutlet weak var scrollViewObj: UIScrollView!
    @IBOutlet weak var btnRegister: UIButton!
    
    var forgotPasswordObj : ForgotPasswordViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.navigationVC?.navigationBar.isHidden = true
        
        imgProfile.layer.cornerRadius =  (UIScreen.main.bounds.size.width / 736 * 90) / 2
        
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.textFieldValidationType = .Email
        
        txtPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtPassword.textFieldValidationType = .Password
        
        let propotionalHight = CGFloat((UIScreen.main.bounds.size.height / 667) * 160)
        bottomConstraintOfloginButton.constant = propotionalHight
        self.view.layoutIfNeeded()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        scrollViewObj.contentSize = CGSize(width:0 , height: btnRegister.frame.size.height + btnRegister.frame.origin.y)
    }
    
    //MARK: LOGIN Button Action
    
    @IBAction func btnLoginClicked(_ sender: AnyObject)
    {
        pushTo(viewController: "loanOptionSecondVc")
        
        
//      pushTo(viewController: "PendingApplicationViewController")
        return
        
        /*
 
        if  TextValidation.isValidate(textField: txtEmail , validationType:.AI_VALIDATION_TYPE_EMAIL) {
            
            if TextValidation.isValidate(textField: txtPassword, validationType: .AI_VALIDATION_TYPE_PASSWORD) {
                
                showHUD()
                
                let user = Login()
                user.email = txtEmail.text!
                user.os_type = "iOS"
                user.password = txtPassword.text!
                user.push_token = "qwertyuiop"
                user.device_id = deviceID
                
                APIManager.sharedInstance.LoginUser(user: user) { (error:NSError?) in
                    
                    if error == nil {
                        self.pushTo(viewController: "shortLoanVc")
                    } else {
                        
                    }
                    self.hideHUD()
                }
                
            }
        }*/

    }
    
    @IBAction func btnRegisterClicked(_ sender: AnyObject)
    {
        self.MoveRegisterVC()
    }
    
    func MoveRegisterVC()
    {
        let registerVCObj = self.storyboard?.instantiateViewController(withIdentifier: "RagisterViewController") as! RagisterViewController
        self.navigationController?.pushViewController(registerVCObj, animated: true)
        
    }
    
    @IBAction func btnforgotPasswordPress(_ sender: AnyObject)
    {
     
        forgotPasswordObj = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        forgotPasswordObj.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        forgotPasswordObj.view.alpha = 0.0
        forgotPasswordObj.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        forgotPasswordObj.delegate = self
        self.view.addSubview(self.forgotPasswordObj .view)
        self.forgotPasswordObj.view.alpha = 1.0
        
        
        UIView.animate(withDuration: 0.1, animations: {
            self.forgotPasswordObj.viewForgotPassword.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { (true) in
            
            UIView.animate(withDuration: 0.2, animations: {
                self.forgotPasswordObj.viewForgotPassword.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            
        }
        
        
        
    }
    
    func removeForgotPassword()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.forgotPasswordObj.view.alpha = 0.0
        }) { (true) in
            self.forgotPasswordObj.view.removeFromSuperview()
        }
    }
    
    override func viewWillLayoutSubviews()
    {
        scrollViewObj.contentSize = CGSize(width:0 , height: btnRegister.frame.size.height + btnRegister.frame.origin.y)
        
    }
    
    func textFieldShouldReturn(_ textField: AITextFieldSquare) -> Bool {
        textField.resignFirstResponder()
        return true
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
