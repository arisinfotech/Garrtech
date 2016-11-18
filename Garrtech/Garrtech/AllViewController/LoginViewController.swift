//
//  LoginViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet var imgProfile: UIImageView!
    
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var txtPassword: AITextFieldSquare!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.navigationVC?.navigationBar.isHidden = true
        
        imgProfile.layer.cornerRadius =  (UIScreen.main.bounds.size.width / 736 * 90) / 2
      
        
        txtEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txtEmail.textFieldValidationType = .Email
        
        txtPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtPassword.textFieldValidationType = .Password
        
     //   txtEmail.delegate = self
     //   txtPassword.delegate = self
        // Do any additional setup after loading the view.
    }

    

    //MARK: LOGIN Button Action
    
    @IBAction func btnLoginClicked(_ sender: AnyObject)
    {
//        if  TextValidation.isValidate(textField: txtEmail , validationType:.AI_VALIDATION_TYPE_EMAIL) {
//            
//            if TextValidation.isValidate(textField: txtPassword, validationType: .AI_VALIDATION_TYPE_PASSWORD) {
        
                let RagisterViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "RagisterViewController") as! RagisterViewController
                self.navigationController?.pushViewController(RagisterViewControllerObj, animated: true)
//            }
//        }
//        
       
    }
    
    
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
