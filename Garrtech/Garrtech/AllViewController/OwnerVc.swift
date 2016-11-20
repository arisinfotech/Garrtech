//
//  OwnerVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class OwnerVc: BaseViewController,UIScrollViewDelegate,UITextFieldDelegate {
    
    
    @IBOutlet var txtName: AITextFieldSquare!
    @IBOutlet var txtTitle: AITextFieldSquare!
    @IBOutlet var txtStreetNumber: AITextFieldSquare!
    @IBOutlet var txtStreenName: AITextFieldSquare!
    @IBOutlet var txtAptSuit: AITextFieldSquare!
    @IBOutlet var txtCity: AITextFieldSquare!
    @IBOutlet var txtState: AITextFieldSquare!
    @IBOutlet var txtZipCode: AITextFieldSquare!
    @IBOutlet var txtHomePhone: AITextFieldSquare!
    @IBOutlet var txtEmail: AITextFieldSquare!
    @IBOutlet var txtMobileNumber: AITextFieldSquare!
    @IBOutlet var txtDOB: AITextFieldSquare!
    @IBOutlet var txtSocialInsurance: AITextFieldSquare!
    @IBOutlet var txtStateProvince: AITextFieldSquare!
    @IBOutlet var txtPercentage: AITextFieldSquare!
    
    var drop_Percentage: UIDropDown!
    var array_Percentage : NSArray!
    
    @IBOutlet var obj_ScrollView: UIScrollView!
    var array1 : NSArray!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doSetUpScreen()
        
    }
    // AllFunctions
    func doSetUpScreen() {
        
        self.title = "OWNER PRINCIPAL INFORMATION"
        
        
        
        obj_ScrollView.delegate = self
        txtPercentage.delegate = self
        
        DispatchQueue.main.async
            {
                
                self.array1 = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
                self.AddDropDown(sender: self.txtPercentage,array_Data: self.array1)
        }
        
        
    }
    func AddDropDown(sender: UITextField!,array_Data:NSArray)
    {
        
        drop_Percentage = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_Percentage.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        drop_Percentage.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        
        //Default,Bouncing,Classic
        drop_Percentage.options = array_Data as! [String]
        drop_Percentage.didSelect { (option, index) in
            sender.text=option;
            sender.textColor=UIColor.clear
            print(option)
        }
        
        self.obj_ScrollView.addSubview(drop_Percentage)
    }
    // MARK - AllActions
    
    
    
    // MARK -  textfieldDelget
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let object1:Bool = drop_Percentage.resign()
        print(object1)
        
        if textField == drop_Percentage {
            return false
        }
        return true
    }
    
    // MARK - scrollviewDeleget
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let object1:Bool = drop_Percentage.resign()
        print(object1)
    }
    
    
    
    
    

    // MARK - AllActions
    @IBAction func btnNextPress(_ sender: AnyObject) {
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
