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
    
    var forgotPasswordObj = ForgotPasswordViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doSetUpScreen()
    }
    override func viewWillAppear(_ animated: Bool){
        self.hideNavigationBar()
    }
    override func viewDidAppear(_ animated: Bool)
    {
        scrollViewObj.contentSize = CGSize(width:0 , height: btnRegister.frame.size.height + btnRegister.frame.origin.y)
    }
    override func viewWillLayoutSubviews()
    {
        scrollViewObj.contentSize = CGSize(width:0 , height: btnRegister.frame.size.height + btnRegister.frame.origin.y)
    }
    
    // MARK: - ALL FUNCTIONS
    
    func doSetUpScreen()  {
        
        self.hideNavigationBar()
        
        imgProfile.layer.cornerRadius =  (UIScreen.main.bounds.size.width / 736 * 90) / 2
        
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.txtType = .Email
        txtEmail.textFieldValidationType = .Email
       // txtEmail.delegate = self
        
        
        //txtPassword.delegate = self
        txtPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtPassword.textFieldValidationType = .Password
        
        let propotionalHight = CGFloat((UIScreen.main.bounds.size.height / 667) * 130)
        bottomConstraintOfloginButton.constant = propotionalHight
        self.view.layoutIfNeeded()
        
        
    }

    func MoveRegisterVC()
    {
        let registerVCObj = self.storyboard?.instantiateViewController(withIdentifier: "RagisterViewController") as! RagisterViewController
        self.navigationController?.pushViewController(registerVCObj, animated: true)
        
    }
    
    func call_UserLoginAPI() {
        
        let user = Login()
        user.email = txtEmail.text!
        user.password = txtPassword.text!
        
        APIManager.sharedInstance.LoginUser(user: user) { (error:NSError?) in
            
            if error == nil {
                
                let homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                appDelegate.navigationVC = UINavigationController.init(rootViewController: homeVC)
                appDelegate.navigationVC?.isNavigationBarHidden = true
                UIView.transition(with: appDelegate.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                    appDelegate.window?.rootViewController = appDelegate.navigationVC
                    }, completion: nil)
            } else {
                
            }
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
    
    
    // MARK: - ALL ACTIONS
    
    @IBAction func btnLoginClicked(_ sender: AnyObject){

        
//         pushTo(viewController: "HomeViewController")
//        pushTo(viewController: "PendingApplicationViewController")
//        return
        
 
        
        if  TextValidation.isValidate(textField: txtEmail , validationType:.AI_VALIDATION_TYPE_EMAIL) {
            
            if TextValidation.isValidate(textField: txtPassword, validationType: .AI_VALIDATION_TYPE_PASSWORD) {
                
                
                if !Reachability.sharedInstance.isReachable() {
                    return
                }
                self.dismissKeyboard()
                self.call_UserLoginAPI()

            }
        }

    }
    
    @IBAction func btnRegisterClicked(_ sender: AnyObject)
    {
        self.MoveRegisterVC()
    }
    
   
    
    @IBAction func btnforgotPasswordPress(_ sender: AnyObject)
    {
     
        self.dismissKeyboard()
        
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
    
    
   
    
    // MARK: - Textfiled Deleget
    
//    func textFieldShouldReturn(_ textField: AITextFieldSquare) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
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
