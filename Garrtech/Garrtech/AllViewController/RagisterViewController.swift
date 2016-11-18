//
//  RagisterViewController.swift
//  Garrtech
//
//  Created by Nikunj Gondaliya on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class RagisterViewController: UIViewController
{

    @IBOutlet var txtFirstName: AITextFieldSquare!
    @IBOutlet var txtLastName: AITextFieldSquare!
    @IBOutlet var txtrEmail: AITextFieldSquare!
    @IBOutlet var txtPassword: AITextFieldSquare!
    @IBOutlet var btnBack: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnBack.contentMode = UIViewContentMode.scaleAspectFit
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Back Button Clieked
    
    @IBAction func btnBackClicked(_ sender: AnyObject) {
        popTo()
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
