//
//  ProfileVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class ProfileVc: UIViewController {
    

    @IBOutlet var btnChnagePw: UIButton!
    @IBOutlet var btnLogout: UIButton!
    
    @IBOutlet var txt_UserName : AITextFieldSquare!
    @IBOutlet var txt_UserEmail : AITextFieldSquare!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnChnagePw.layer.cornerRadius=5.0;
        btnChnagePw.layer.masksToBounds=true;
        
        btnLogout.layer.cornerRadius=5.0;
        btnLogout.layer.masksToBounds=true;

        // Do any additional setup after loading the view.
        
        txt_UserName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserName.textFieldValidationType = .Name
        
        txt_UserEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserEmail.textFieldValidationType = .Email

        
        
    }
  
    @IBAction func btn_PasswordChange(_ sender: AnyObject) {
        
        
        if  TextValidation.isValidate(textField: txt_UserName , validationType:.AI_VALIDATION_TYPE_NAME) {
            
                    if TextValidation.isValidate(textField: txt_UserEmail, validationType: .AI_VALIDATION_TYPE_EMAIL) {
                        
                        
                        print("success")
                        
                
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
