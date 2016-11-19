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
