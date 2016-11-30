//
//  ForgotPasswordViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 19/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

protocol CloseForgotPasswordScreenDelegate
{
    func removeForgotPassword()
}

class ForgotPasswordViewController: UIViewController
{
    var delegate:CloseForgotPasswordScreenDelegate!
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var lbl_Title: UILabel!
    @IBOutlet var viewForgotPassword: UIView!
    @IBOutlet var lblForgotPassword: UILabel!
    @IBOutlet weak var ForgotTitleViewObj: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.doSetUpScreen()

    }
    
    // MARK: - ALL FUNCTIONS
    
    func doSetUpScreen() {
        
        lbl_Title.textColor = UIColor.white
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.textFieldValidationType = .Email
        
        viewForgotPassword.layer.cornerRadius = 5
        lblForgotPassword.clipsToBounds = true
        viewForgotPassword.clipsToBounds = true
        ForgotTitleViewObj.clipsToBounds = true
        
        viewForgotPassword.setShadowView(width: 0, height: 0, Opacidade: 0.7, maskToBounds: false, radius: 5)
     
    }
    
    // MARK: - ALL ACTIONS
    
    
    @IBAction func btnClosePress(_ sender: AnyObject)
    {
        delegate.removeForgotPassword()
    }
    
    @IBAction func btnForgotPasswordPress(_ sender: AnyObject)
    {
        if Reachability.sharedInstance.isReachable() {
            
            if  TextValidation.isValidate(textField: txtEmail , validationType:.AI_VALIDATION_TYPE_EMAIL) {
                let forgotPass = ForgotPassword()
                forgotPass.email = txtEmail.text!
                
                APIManager.sharedInstance.ForgotPassword(forgotPass: forgotPass, completion: { (error:NSError?) in
                    if error == nil {
                        self.delegate.removeForgotPassword()
                    }
                })
                
            }
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
