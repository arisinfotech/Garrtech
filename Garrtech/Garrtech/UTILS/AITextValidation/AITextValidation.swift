//
//  AIServiceManager.swift
//  ScarletAndBleu
//
//  Created by Dhaval Nena on 23/05/16.
//  Copyright © 2016 Dhaval Nena. All rights reserved.
//


import UIKit

let TextValidation = AITextValidation.sharedManager

enum validationTYPE : Int {
    case AI_VALIDATION_TYPE_NAME
    case AI_VALIDATION_TYPE_EMAIL
    case AI_VALIDATION_TYPE_PHONE
    case AI_VALIDATION_TYPE_PASSWORD
    case AI_VALIDATION_TYPE_CONFIRMPASSWORD
    
    case AI_VALIDATION_TYPE_CAMPUS
    case AI_VALIDATION_TYPE_LOCATION
    
}


class AITextValidation: NSObject {
	
   
    
    // MARK:  ________________ SHARED MANAGER
	class var sharedManager: AITextValidation {
		struct Static {
            
        
            static var onceToken: dispatch_time_t = 0
            
            
		//	static var onceToken: dispatch_once_t = 0
			static var instance: AITextValidation? = nil
		}
		//dispatch_once(&Int(Static.onceToken)) {
			Static.instance = AITextValidation()
		//}
		return Static.instance!
	}
   
    
  
    // MARK: ________________________ NORMALE VALIDATION FUNCTION________________________
    
    
    
    
    func isValidate(textField : AITextFieldSquare ,validationType : validationTYPE) -> Bool {
        
        let finalString = textField.text!.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textField.text = finalString
        
        if checkString(string: finalString) {
            self.blankTextValidation(validationType: validationType)
            return false
        }else{
            // for perticular textfiled validation
            
            if validationType == .AI_VALIDATION_TYPE_EMAIL {
                if !self.isValidEmail(testStr: finalString) {
                    self.validTextLengthValidation(validationType: validationType)
                    return false
                }
            }
            
        }
       
        var minLength : Int
        minLength = textField.minLength!
        
        var maxLength : Int
        maxLength = textField.maxLength!
        
        var curruntLength : Int
        curruntLength = (finalString.characters.count)
       
        if maxLength>0 {
            if curruntLength >= minLength &&  curruntLength <=  maxLength {
                return true
            }
            else{
                self.validTextLengthValidation(validationType: validationType)
                return false
            }
        }else{
            if curruntLength >= minLength {
                return true
            }
            else{
                self.validTextLengthValidation(validationType: validationType)
                return false
            }
        
        }
        
        
    }
 
    
    func blankTextValidation(validationType : validationTYPE) {
    
        // display alert with mesage
        
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_NAME = validationType {
            message = message_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHONE = validationType {
            message = message_Phone_Blank
        }
        else if case .AI_VALIDATION_TYPE_EMAIL = validationType {
            message = message_Email_Blank
        }
        else if case .AI_VALIDATION_TYPE_PASSWORD = validationType {
            message = message_Password_Blank
        }
        else if case .AI_VALIDATION_TYPE_CONFIRMPASSWORD = validationType {
            message = message_ConfirmPassword_Blank
        }
        else if case .AI_VALIDATION_TYPE_CAMPUS = validationType {
            message = message_Campus_Blank
        }
        else if case .AI_VALIDATION_TYPE_LOCATION = validationType {
            message = message_Location_Blank
        }
        else{
            message = message_Default_Blank
        }
        
        self.displayAlert(message: message)
 
    }
    
    func validTextLengthValidation(validationType : validationTYPE) {
        
        // display alert with mesage
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_NAME = validationType {
            message = message_Name_Length_NotValid
        }
        else if case .AI_VALIDATION_TYPE_PHONE = validationType {
            message = message_Phone_Length_NotValid
        }
        else if case .AI_VALIDATION_TYPE_EMAIL = validationType {
            message = message_Email_NotValid
        }
        else if case .AI_VALIDATION_TYPE_PASSWORD = validationType {
            message = message_Password_NotValid
        }
        else if case .AI_VALIDATION_TYPE_CONFIRMPASSWORD = validationType {
            message = message_ConfirmPassword_NotValid
        }
        else{
            message = message_Default_Blank
        }
        
        self.displayAlert(message: message)
        
       
    }
    
    func displayAlert(message:String) {
        
        Alert.displayAlertWithMessage(message: message, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: { (index) in
            
        })
        
    }
    
   
    
    func setMinLengthByValidationType(validationType : validationTYPE) -> Int {
        
        if case .AI_VALIDATION_TYPE_NAME = validationType {
            return 5
        }
        else if case .AI_VALIDATION_TYPE_PHONE = validationType {
            return 10
        }
        else{
            return 1
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
     
     //   let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailRegEx = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Za-z0-9]+\\.([A-Za-z])*([A-Za-z0-9]+\\.[A-Za-z]{2,4})*"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func checkString(string:String) -> Bool {
        
        if string.isEmpty || string == "" {
            return true
        }
        else{
            return false
        }
        
    }
    
    // MARK: ________________ OTHER VALIDATION FUNCTION _________________
    // MARK:-
    
    func isFillTextFiled(text: String ,validationType : validationTYPE) -> Bool {
        
        let finalString = text.trimmingCharacters(in: NSCharacterSet.whitespaces)
        
        if checkString(string: finalString) {
            self.blankTextValidation(validationType: validationType)
            return false
        }else{
            return true
        }
        
        
    }
    

}

// ALL VALIDATION TEXT MICROS

let message_Name_Blank = "Name is required"
let message_Name_Length_NotValid = "Name is invalid"

let message_Phone_Blank = "Phone number is required"
let message_Phone_Length_NotValid = "Phone number must have at least 10 digits"

let message_Email_Blank = "Email address is required"
let message_Email_NotValid = "Email address is invalid"

let message_Password_Blank = "Password is required"
let message_Password_NotValid = "Password must be having at least 6 characters"

let message_ConfirmPassword_Blank = "Confirm Password is required"
let message_ConfirmPassword_NotValid = "Confirm Password must be having at least 6 characters"

let message_Campus_Blank = "Campus selection is required"
let message_Location_Blank = "Delivery Location selection is required"


let message_Default_Blank = "Please fill textfiled"



