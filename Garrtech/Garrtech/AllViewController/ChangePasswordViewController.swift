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
        txtOldPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtOldPassword.textFieldValidationType = .Password
        
        txtNewPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtNewPassword.textFieldValidationType = .Password
        
        txtComfirmPassword.setUpTextFieldForLengthValidation(minLength: 6, maxLength: 50)
        txtComfirmPassword.textFieldValidationType = .Password

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.title = "CHANGE PASSWORD"
   
    }
    
    func textFieldShouldReturn(_ textField: AITextFieldSquare) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func changePassPress(sender: UIButton) {
        
        
        let password = ChangePassword()
        password.old_password = txtOldPassword.text
        password.new_password = txtNewPassword.text
        password.confirm_password = txtComfirmPassword.text
        
        showHUD()
        
        APIManager.sharedInstance.ChangePassword(password: password) { (error:NSError?) in
            
            if error == nil {
                
            }
            self.hideHUD()
            
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
