//
//  SceduleCallViewController.swift
//  Garrtech
//
//  Created by Ankit on 10/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class SceduleCallViewController: BaseViewController {

    
    @IBOutlet var txtMobile: AITextFieldSquare!
    @IBOutlet var txtDate: AITextFieldSquare!
    @IBOutlet var txtTime: AITextFieldSquare!

    var drop_Time: UIDropDown!
    var dtPicker = UIDatePicker()
    
    let arrTime = ["10AM - 12PM","12PM - 02PM","02PM - 04PM","04PM - 06PM", "06PM - 08PM"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alert.displayUnderDevMessage()

        dtPicker.minimumDate = Date.init()
        txtDate.inputView = dtPicker
        dtPicker.datePickerMode = .date
        self.doSetUpScreen()
        // Do any additional setup after loading the view.
    }

    
    func doSetUpScreen()
    {
        self.title = "SCHADULE A CALL"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popToRoot))
        
        txtMobile.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 10)
        txtMobile.textFieldValidationType = .Phone
        
        DispatchQueue.main.async {
            self.AddDropDown(sender: self.txtTime, array_Data: self.arrTime)
        }
        
        
        
    }
    
    func AddDropDown(sender: UITextField!,array_Data:[String])
    {
        
        drop_Time = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_Time.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //  drop_Retail.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        //Default,Bouncing,Classic
        drop_Time.options = array_Data
        drop_Time.didSelect { (option, index) in
            
            sender.text=option;
            sender.textColor=UIColor.clear
            
        }
        
        self.view.addSubview(drop_Time)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func scheduleBtnPress() {
        
        if BusinessTextValidation.isValidate(textField: txtMobile, validationType: .AI_VALIDATION_TYPE_BUSINESS_PHONE_NUMBER) {
            
        }
        
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
