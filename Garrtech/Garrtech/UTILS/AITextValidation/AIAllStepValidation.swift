//
//  AIServiceManager.swift
//  ScarletAndBleu
//
//  Created by Dhaval Nena on 23/05/16.
//  Copyright © 2016 Dhaval Nena. All rights reserved.
//


import UIKit



enum BusinessValidationTYPE : Int
{
    case AI_VALIDATION_TYPE_BUSINESS_NAME //txtBusinessName
    case AI_VALIDATION_TYPE_DBA_NAME //txtDbaName
    case AI_VALIDATION_TYPE_DATE_ESTABLISHED // SELECT DATE
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NUMBER
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NAME
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_API_SUIT_UNIT
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_CITY
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_STATE
    case AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_ZIPCODE
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NUMBER
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NAME
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_API_SUIT_UNIT
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_CITY
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_STATE
    case AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_ZIPCODE
    case AI_VALIDATION_TYPE_BUSINESS_PHONE_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_FAX_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_MOBILE_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_EMAIL_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_WEBSITE_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_TAX_TD_NUMBER_OR_BUSINESS_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_TERMINAL_POS_MAKE_MODEL_NUMBER
    case AI_VALIDATION_TYPE_BUSINESS_YEARS_IN_CONTROL
    case AI_VALIDATION_TYPE_BUSINESS_MONTH_IN_CONTROL
    case AI_VALIDATION_TYPE_BUSINESS_PRODUCT_SOLD
    case AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_NAME
    case AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COTACT_NAME
    case AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_PHONE
    case AI_VALIDATION_TYPE_BUSINESS_RENT_MORTGAGE_PAYMENT
    
}


let BusinessTextValidation = BusinessLoanValidation.sharedManager
class BusinessLoanValidation: NSObject {
    
    
    // MARK:  ________________ SHARED MANAGER
    class var sharedManager: BusinessLoanValidation {
        struct Static {
            
            static var onceToken: dispatch_time_t = 0
            static var instance: BusinessLoanValidation? = nil
        }
        Static.instance = BusinessLoanValidation()
        return Static.instance!
    }
    
    
    
    // MARK: ________________________ NORMALE VALIDATION FUNCTION________________________
    
    
    
    
    func isValidate(textField : AITextFieldSquare ,validationType : BusinessValidationTYPE) -> Bool {
        
        let finalString = textField.text!.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textField.text = finalString
        
        if checkString(string: finalString) {
            self.blankTextValidation(validationType: validationType)
            return false
        }else{
            // for perticular textfiled validation
            
             if validationType == .AI_VALIDATION_TYPE_BUSINESS_EMAIL_NUMBER {
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
    
    func isValidEmail(testStr:String) -> Bool {
        
        //   let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailRegEx = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Za-z0-9]+\\.([A-Za-z])*([A-Za-z0-9]+\\.[A-Za-z]{2,4})*"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func blankTextValidation(validationType : BusinessValidationTYPE) {
        
        // display alert with mesage
        
        var message : String = String()
        
        
        if case .AI_VALIDATION_TYPE_BUSINESS_NAME = validationType {
            message = message_Business_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_DBA_NAME = validationType {
            message = message_DBA_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_DATE_ESTABLISHED = validationType {
            message = message_Date_Business_Established_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NUMBER = validationType {
            message = message_Physical_Address_StreetN_Num_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NAME = validationType {
            message = message_Physical_Address_StreetN_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_API_SUIT_UNIT = validationType {
            message = message_Physical_Address_StreetN_APT_SUIT_UNIT_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_CITY = validationType {
            message = message_Physical_Address_City_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_STATE = validationType {
            message = message_Physical_Address_State_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_ZIPCODE = validationType {
            message = message_Physical_Address_ZipCode_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NUMBER = validationType {
            message = message_Mailing_Address_StreetN_Num_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NAME = validationType {
            message = message_Mailing_Address_StreetN_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_API_SUIT_UNIT = validationType {
            message = message_Mailing_Address_StreetN_APT_SUIT_UNIT_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_CITY = validationType {
            message = message_Mailing_Address_City_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_STATE = validationType {
            message = message_Mailing_Address_State_Blank
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_ZIPCODE = validationType {
            message = message_Mailing_Address_ZipCode_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_PHONE_NUMBER = validationType {
            message = message_Business_Info_Phone_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_FAX_NUMBER = validationType {
            message = message_Business_Info_Fax_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_MOBILE_NUMBER = validationType {
            message = message_Business_Info_Mobile_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_EMAIL_NUMBER = validationType {
            message = message_Business_Info_Email_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_WEBSITE_NUMBER = validationType {
            message = message_Business_Info_Website_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_TAX_TD_NUMBER_OR_BUSINESS_NUMBER = validationType {
            message = message_Business_Info_Tax_ID_Number_or_Business_Number_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_TERMINAL_POS_MAKE_MODEL_NUMBER = validationType {
            message = message_Business_Info_Terminal_POS_Make_Model_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_YEARS_IN_CONTROL = validationType {
            message = message_Business_Info_Years_in_Control_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_MONTH_IN_CONTROL = validationType {
            message = message_Business_Info_Month_in_Control_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_PRODUCT_SOLD = validationType {
            message = message_Business_Info_Product_sold_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_NAME = validationType {
            message = message_Business_Info_Landlord_Mortgage_Company_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COTACT_NAME = validationType {
            message = message_Business_Info_Landlord_Mortgage_Contact_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_PHONE = validationType {
            message = message_Business_Info_Landlord_Mortgage_Company_Phone_Blank
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_RENT_MORTGAGE_PAYMENT = validationType {
            message = message_Business_Info_Rent_Mortgage_Payment_Blank
        }
        
        self.displayAlert(message: message)
        
    }
    
    func validTextLengthValidation(validationType : BusinessValidationTYPE) {
        
        // display alert with mesage
        var message : String = String()
        
        
        
        if case .AI_VALIDATION_TYPE_BUSINESS_NAME = validationType {
            message = message_Business_Name_NotValid
        }
        else if case .AI_VALIDATION_TYPE_DBA_NAME = validationType {
            message = message_DBA_Name_NotValid
        }
        else if case .AI_VALIDATION_TYPE_DATE_ESTABLISHED = validationType {
            message = message_Date_Business_Established_Blank
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NUMBER = validationType {
            message = message_Physical_Address_StreetN_Num_Invalid
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_NAME = validationType {
            message = message_Physical_Address_StreetN_Name_Invalid
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_API_SUIT_UNIT = validationType {
            message = message_Physical_Address_StreetN_APT_SUIT_UNIT_Invalid
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_CITY = validationType {
            message = message_Physical_Address_City_Invalid
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_STATE = validationType {
            message = message_Physical_Address_State_Invalid
        }
        else if case .AI_VALIDATION_TYPE_PHYSICAL_ADDRESS_STREET_ZIPCODE = validationType {
            message = message_Physical_Address_ZipCode_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NUMBER = validationType {
            message = message_Mailing_Address_StreetN_Num_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_NAME = validationType {
            message = message_Mailing_Address_StreetN_Name_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_API_SUIT_UNIT = validationType {
            message = message_Mailing_Address_StreetN_APT_SUIT_UNIT_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_CITY = validationType {
            message = message_Mailing_Address_City_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_STATE = validationType {
            message = message_Mailing_Address_State_Invalid
        }
        else if case .AI_VALIDATION_TYPE_MAILING_ADDRESS_STREET_ZIPCODE = validationType {
            message = message_Mailing_Address_ZipCode_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_PHONE_NUMBER = validationType {
            message = message_Business_Info_Phone_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_FAX_NUMBER = validationType {
            message = message_Business_Info_Fax_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_MOBILE_NUMBER = validationType {
            message = message_Business_Info_Mobile_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_EMAIL_NUMBER = validationType {
            message = message_Business_Info_Email_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_WEBSITE_NUMBER = validationType {
            message = message_Business_Info_website_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_TAX_TD_NUMBER_OR_BUSINESS_NUMBER = validationType {
            message = message_Business_Info_Tax_ID_Number_or_Business_Number_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_TERMINAL_POS_MAKE_MODEL_NUMBER = validationType {
            message = message_Business_Info_Terminal_POS_Make_Model_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_YEARS_IN_CONTROL = validationType {
            message = message_Business_Info_Years_in_Control_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_MONTH_IN_CONTROL = validationType {
            message = message_Business_Info_Month_in_Control_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_PRODUCT_SOLD = validationType {
            message = message_Business_Info_Product_sold_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_NAME = validationType {
            message = message_Business_Info_Landlord_Mortgage_Company_Name_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COTACT_NAME = validationType {
            message = message_Business_Info_Landlord_Mortgage_Contach_Name_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_LANDLORD_MORTGAGE_COMPANY_PHONE = validationType {
            message = message_Business_Info_Landlord_Mortgage_Company_Phone_Invalid
        }
        else if case .AI_VALIDATION_TYPE_BUSINESS_RENT_MORTGAGE_PAYMENT = validationType {
            message = message_Business_Info_Rent_Mortgage_Payment_Invalid
        }
        
        
        
        self.displayAlert(message: message)
        
        
    }
    
    func displayAlert(message:String) {
        
        Alert.displayAlertWithMessage(message: message, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: { (index) in
            
        })
        
    }
    
    
    
    func checkString(string:String) -> Bool {
        
        if string.isEmpty || string == "" {
            return true
        }
        else{
            return false
        }
        
    }
    
    
}


// BUSINESS LOAN TEXTFILED VALIDATION MESSAGE

let isRequired = " is required"
let isInvalid = " is invalid"

let message_Business_Name_Blank = "Business Name" + isRequired
let message_Business_Name_NotValid = "Business Name" + isInvalid

let message_DBA_Name_Blank = "DBA Name" + isRequired
let message_DBA_Name_NotValid = "DBA Name" + isInvalid

let message_Date_Business_Established_Blank = "Date Business Established" + isRequired

let message_Physical_Address_StreetN_Num_Blank = "Physical address street number" + isRequired
let message_Physical_Address_StreetN_Num_Invalid = "Physical address street number" + isInvalid

let message_Physical_Address_StreetN_Name_Blank = "Physical address street name" + isRequired
let message_Physical_Address_StreetN_Name_Invalid = "Physical address street name" + isInvalid


let message_Physical_Address_StreetN_APT_SUIT_UNIT_Blank = "Physical address street app/suit/unit" + isRequired
let message_Physical_Address_StreetN_APT_SUIT_UNIT_Invalid = "Physical address street app/suit/unit" + isInvalid


let message_Physical_Address_City_Blank = "Physical address city" + isRequired
let message_Physical_Address_City_Invalid = "Physical address city" + isInvalid

let message_Physical_Address_State_Blank = "Physical address state" + isRequired
let message_Physical_Address_State_Invalid = "Physical address state" + isInvalid


let message_Physical_Address_ZipCode_Blank = "Physical address zip code" + isRequired
let message_Physical_Address_ZipCode_Invalid = "Physical address zip code" + isInvalid


let message_Mailing_Address_StreetN_Num_Blank = "Mailing address street number" + isRequired
let message_Mailing_Address_StreetN_Num_Invalid = "Mailing address street number" + isInvalid

let message_Mailing_Address_StreetN_Name_Blank = "Mailing address street name" + isRequired
let message_Mailing_Address_StreetN_Name_Invalid = "Mailing address street name" + isInvalid


let message_Mailing_Address_StreetN_APT_SUIT_UNIT_Blank = "Mailing address street app/suit/unit" + isRequired
let message_Mailing_Address_StreetN_APT_SUIT_UNIT_Invalid = "Mailing address street app/suit/unit" + isInvalid


let message_Mailing_Address_City_Blank = "Mailing address city" + isRequired
let message_Mailing_Address_City_Invalid = "Mailing address city" + isInvalid


let message_Mailing_Address_State_Blank = "Mailing address state" + isRequired
let message_Mailing_Address_State_Invalid = "Mailing address state" + isInvalid

let message_Mailing_Address_ZipCode_Blank = "Mailing address zip code" + isRequired
let message_Mailing_Address_ZipCode_Invalid = "Mailing address zip code" + isInvalid


//-------Business Info


let message_Business_Info_Phone_Blank = "Business Phone number" + isRequired
let message_Business_Info_Phone_Invalid = "Business Phone number" + isInvalid

let message_Business_Info_Fax_Blank = "Business Fax number" + isRequired
let message_Business_Info_Fax_Invalid = "Business Fax number" + isInvalid

let message_Business_Info_Mobile_Blank = "Business Mobile number" + isRequired
let message_Business_Info_Mobile_Invalid = "Business Mobile number" + isInvalid

let message_Business_Info_Email_Blank = "Business email address" + isRequired
let message_Business_Info_Email_Invalid = "Business email address" + isInvalid

let message_Business_Info_Website_Blank = "Business website" + isRequired
let message_Business_Info_website_Invalid = "Business website" + isInvalid

let message_Business_Info_Tax_ID_Number_or_Business_Number_Blank = "Tax id number or business number" + isRequired
let message_Business_Info_Tax_ID_Number_or_Business_Number_Invalid = "Tax id number or business number" + isInvalid

let message_Business_Info_Terminal_POS_Make_Model_Blank = "Terminal/POS Make/Model" + isRequired
let message_Business_Info_Terminal_POS_Make_Model_Invalid = "Terminal/POS Make/Model" + isInvalid

let message_Business_Info_Years_in_Control_Blank = "Years in Control" + isRequired
let message_Business_Info_Years_in_Control_Invalid = "Years in Control" + isInvalid

let message_Business_Info_Month_in_Control_Blank = "Month in Control" + isRequired
let message_Business_Info_Month_in_Control_Invalid = "Invalid in Control" + isInvalid

let message_Business_Info_Product_sold_Blank = "Products sold text" + isRequired
let message_Business_Info_Product_sold_Invalid = "Products sold text" + isInvalid


let message_Business_Info_Landlord_Mortgage_Company_Name_Blank = "Landlord/Mortgage Company Name" + isRequired
let message_Business_Info_Landlord_Mortgage_Company_Name_Invalid = "Landlord/Mortgage Company Name" + isInvalid

let message_Business_Info_Landlord_Mortgage_Contact_Name_Blank = "Landlord/Mortgage contact Name" + isRequired
let message_Business_Info_Landlord_Mortgage_Contach_Name_Invalid = "Landlord/Mortgage contact Name" + isInvalid

let message_Business_Info_Landlord_Mortgage_Company_Phone_Blank = "Landlord/Mortgage company Phone" + isRequired
let message_Business_Info_Landlord_Mortgage_Company_Phone_Invalid = "Landlord/Mortgage company Phone" + isInvalid

let message_Business_Info_Rent_Mortgage_Payment_Blank = "Rent/Mortgage Payment" + isRequired
let message_Business_Info_Rent_Mortgage_Payment_Invalid = "Rent/Mortgage Payment" + isInvalid




// ......................................



enum CompanyValidationTYPE : Int
{
    case AI_VALIDATION_TYPE_AVG_MONTHALY_SALES
    case AI_VALIDATION_TYPE_TOTAL_MONTHALY_SALES
    case AI_VALIDATION_TYPE_ANNUAL_GROSS_SALES
    case AI_VALIDATION_TYPE_DESIRE_FUNDING_AMMOUNT
    case AI_VALIDATION_TYPE_USE_OF_FUNDS
    case AI_VALIDATION_TYPE_BALANCE_IF_YES
    case AI_VALIDATION_TYPE_TOTAL_HELD_WIDTH
    
}


let CompanyTextValidation = CompanyLoanValidation.sharedManager
class CompanyLoanValidation: NSObject {
    
    
    // MARK:  ________________ SHARED MANAGER
    class var sharedManager: CompanyLoanValidation {
        struct Static {
            
            static var onceToken: dispatch_time_t = 0
            static var instance: CompanyLoanValidation? = nil
        }
        Static.instance = CompanyLoanValidation()
        return Static.instance!
    }
    
    
    
    // MARK: ________________________ NORMALE VALIDATION FUNCTION________________________
    
    
    
    
    func isValidate(textField : AITextFieldSquare ,validationType : CompanyValidationTYPE) -> Bool {
        
        let finalString = textField.text!.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textField.text = finalString
        
        if checkString(string: finalString) {
            self.blankTextValidation(validationType: validationType)
            return false
        }else{
            // for perticular textfiled validation
            /*
             if validationType == .AI_VALIDATION_TYPE_EMAIL {
             if !self.isValidEmail(testStr: finalString) {
             self.validTextLengthValidation(validationType: validationType)
             return false
             }
             }
             */
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
    
    
    func blankTextValidation(validationType : CompanyValidationTYPE) {
        
        // display alert with mesage
        
        
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_AVG_MONTHALY_SALES = validationType {
            message = message_Average_Month_Sales_Blank
        }
        else if case .AI_VALIDATION_TYPE_TOTAL_MONTHALY_SALES = validationType {
            message = message_Total_Month_Sales_Blank
        }
        else if case .AI_VALIDATION_TYPE_ANNUAL_GROSS_SALES = validationType {
            message = message_Annual_Gross_Seles_Blank
        }
        else if case .AI_VALIDATION_TYPE_DESIRE_FUNDING_AMMOUNT = validationType {
            message = message_Desire_Funding_Amount_Blank
        }
        else if case .AI_VALIDATION_TYPE_USE_OF_FUNDS = validationType {
            message = message_Use_Of_Funds_Blank
        }
        else if case .AI_VALIDATION_TYPE_BALANCE_IF_YES = validationType {
            message = message_Balance_If_Yes_Blank
        }
        else if case .AI_VALIDATION_TYPE_TOTAL_HELD_WIDTH = validationType {
            message = message_Held_With_Blank
        }
        
        self.displayAlert(message: message)
        
    }
    
    func validTextLengthValidation(validationType : CompanyValidationTYPE) {
        
        // display alert with mesage
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_AVG_MONTHALY_SALES = validationType {
            message = message_Average_Month_Sales_NotValid
        }
        else if case .AI_VALIDATION_TYPE_TOTAL_MONTHALY_SALES = validationType{
            message = message_Total_Month_Sales_NotValid
        }
        else if case .AI_VALIDATION_TYPE_ANNUAL_GROSS_SALES = validationType{
            message = message_Annual_Gross_Seles_NotValid
        }
        else if case .AI_VALIDATION_TYPE_DESIRE_FUNDING_AMMOUNT = validationType{
            message = message_Desire_Funding_Amount_NotValid
        }
        else if case .AI_VALIDATION_TYPE_USE_OF_FUNDS = validationType{
            message = message_Use_Of_Funds_NotValid
        }
        else if case .AI_VALIDATION_TYPE_BALANCE_IF_YES = validationType{
            message = message_Balance_If_Yes_NotValid
        }
        else if case .AI_VALIDATION_TYPE_TOTAL_HELD_WIDTH = validationType{
            message = message_Held_With_NotValid
        }
        
        self.displayAlert(message: message)
        
    }
    
    func displayAlert(message:String) {
        
        Alert.displayAlertWithMessage(message: message, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: { (index) in
            
        })
        
    }
    
    
    
    func checkString(string:String) -> Bool {
        
        if string.isEmpty || string == "" {
            return true
        }
        else{
            return false
        }
        
    }
    
    
}



// COMPANY LOAN TEXTFILED VALIDATION MESSAGE

let message_Average_Month_Sales_Blank = "Average monath sales is required"
let message_Average_Month_Sales_NotValid = "Average month sales is invalid"

let message_Total_Month_Sales_Blank = "Total monath sales is required"
let message_Total_Month_Sales_NotValid = "Total month sales is invalid"

let message_Annual_Gross_Seles_Blank = "Annual gross sales is required"
let message_Annual_Gross_Seles_NotValid = "Annual gross sales is invalid"

let message_Desire_Funding_Amount_Blank = "Desired Funding Amount is required"
let message_Desire_Funding_Amount_NotValid = "Desired Funding Amount is invalid"

let message_Use_Of_Funds_Blank = "Use of Funds is required"
let message_Use_Of_Funds_NotValid = "Use of Funds is invalid"

let message_Balance_If_Yes_Blank = "Current Loan/Advance Balance is required"
let message_Balance_If_Yes_NotValid = "Current Loan/Advance Balance is invalid"

let message_Held_With_Blank = "Held With is required"
let message_Held_With_NotValid = "Held With is invalid"



// ........................

enum OwnerValidationTYPE : Int
{
    case AI_VALIDATION_TYPE_NAME
    case AI_VALIDATION_TYPE_TITLE
    case AI_VALIDATION_STREET_NUMBER
    case AI_VALIDATION_STREET_NAME
    case AI_VALIDATION_APT_SUIT
    case AI_VALIDATION_CITY
    case AI_VALIDATION_STATE
    case AI_VALIDATION_ZIPCODE
    case AI_VALIDATION_HOMEPHONE
    case AI_VALIDATION_OWNER_EMAIL
    case AI_VALIDATION_MOBILE_NUMBER
    case AI_VALIDATION_DOB
    case AI_VALIDATION_SOCIAL_INSURANCE
    case AI_VALIDATION_SATATE_PROVINCE
    case AI_VALIDATION_PERCENTANGE
    case AI_VALIDATION_DRIVING_NUMBER

}



let OwnerTextValidation = OwnerLoanValidation.sharedManager
class OwnerLoanValidation: NSObject {
    
    
    // MARK:  ________________ SHARED MANAGER
    class var sharedManager: OwnerLoanValidation {
        struct Static {
            
            static var onceToken: dispatch_time_t = 0
            static var instance: OwnerLoanValidation? = nil
        }
        Static.instance = OwnerLoanValidation()
        return Static.instance!
    }
    
    
    
    // MARK: ________________________ NORMALE VALIDATION FUNCTION________________________
    
    
    
    
    func isValidate(textField : AITextFieldSquare ,validationType : OwnerValidationTYPE) -> Bool {
        
        let finalString = textField.text!.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textField.text = finalString
        
        if checkString(string: finalString) {
            self.blankTextValidation(validationType: validationType)
            return false
        }else{
            // for perticular textfiled validation
            
             if validationType == .AI_VALIDATION_OWNER_EMAIL {
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
    
    func isValidEmail(testStr:String) -> Bool {
        
        //   let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailRegEx = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Za-z0-9]+\\.([A-Za-z])*([A-Za-z0-9]+\\.[A-Za-z]{2,4})*"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    func blankTextValidation(validationType : OwnerValidationTYPE) {
        
        // display alert with mesage
        
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_NAME = validationType {
            message = message_Owner_Name_Blank
        }
        else if case .AI_VALIDATION_TYPE_TITLE = validationType {
            message = message_Title_Blank
        }
        else if case .AI_VALIDATION_STREET_NUMBER = validationType {
            message = message_Street_Number_Blank
        }
        else if case .AI_VALIDATION_STREET_NAME = validationType {
            message = message_Street_Name_Blank
        }
        else if case .AI_VALIDATION_APT_SUIT = validationType {
            message = message_Apt_NotValid
        }
        else if case .AI_VALIDATION_CITY = validationType {
            message = message_City_Blank
        }
        else if case .AI_VALIDATION_STATE = validationType {
            message = message_State_Blank
        }
        else if case .AI_VALIDATION_ZIPCODE = validationType {
            message = message_Zipcode_Blank
        }
        else if case .AI_VALIDATION_HOMEPHONE = validationType {
            message = message_HomePhone_Blank
        }
        else if case .AI_VALIDATION_OWNER_EMAIL = validationType {
            message = message_Owner_Email_Blank
        }
        else if case .AI_VALIDATION_DOB = validationType {
            message = message_DOB_Blank
        }
        else if case .AI_VALIDATION_SOCIAL_INSURANCE = validationType {
            message = message_Social_Security_Blank
        }
        else if case .AI_VALIDATION_MOBILE_NUMBER = validationType {
            message = message_Mobile_Blank
        }
        else if case .AI_VALIDATION_SATATE_PROVINCE = validationType {
            message = message_DriverIssuance_Blank
        }
        else if case .AI_VALIDATION_PERCENTANGE = validationType {
            message = message_Percentage_Blank
        }
        else if case .AI_VALIDATION_DRIVING_NUMBER = validationType {
            message = message_DriverLicense_Blank
        }
        
        self.displayAlert(message: message)
        
    }
    
    func validTextLengthValidation(validationType : OwnerValidationTYPE) {
        
        // display alert with mesage
        var message : String = String()
        
        if case .AI_VALIDATION_TYPE_NAME = validationType {
            message = message_Owner_Name_NotValid
        }
        else if case .AI_VALIDATION_TYPE_TITLE = validationType {
            message = message_Title_NotValid
        }
        else if case .AI_VALIDATION_STREET_NUMBER = validationType {
            message = message_Street_Number_NotValid
        }
        else if case .AI_VALIDATION_STREET_NAME = validationType {
            message = message_Street_Name_NotValid
        }
        else if case .AI_VALIDATION_APT_SUIT = validationType {
            message = message_Apt_NotValid
        }
        else if case .AI_VALIDATION_CITY = validationType {
            message = message_City_NotValid
        }
        else if case .AI_VALIDATION_STATE = validationType {
            message = message_State_NotValid
        }
        else if case .AI_VALIDATION_ZIPCODE = validationType {
            message = message_Zipcode_NotValid
        }
        else if case .AI_VALIDATION_HOMEPHONE = validationType {
            message = message_HomePhone_NotValid
        }
        else if case .AI_VALIDATION_OWNER_EMAIL = validationType {
            message = message_Owner_Email_NotValid
        }
        else if case .AI_VALIDATION_DOB = validationType {
            message = message_DOB_NotValid
        }
        else if case .AI_VALIDATION_SOCIAL_INSURANCE = validationType {
            message = message_Social_Security_NotValid
        }
        else if case .AI_VALIDATION_MOBILE_NUMBER = validationType {
            message = message_Mobile_NotValid
        }
        else if case .AI_VALIDATION_SATATE_PROVINCE = validationType {
            message = message_DriverIssuance_NotValid
        }
        else if case .AI_VALIDATION_PERCENTANGE = validationType {
            message = message_Percentage_NotValid
        }
        else if case .AI_VALIDATION_DRIVING_NUMBER = validationType {
            message = message_DriverLicense_NotValid
        }
        
        
        
        self.displayAlert(message: message)
        
        
    }
    
    func displayAlert(message:String) {
        
        Alert.displayAlertWithMessage(message: message, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: { (index) in
            
        })
        
    }
    
    
    
    func checkString(string:String) -> Bool {
        
        if string.isEmpty || string == "" {
            return true
        }
        else{
            return false
        }
        
    }
    
    
}




// COMPANY LOAN TEXTFILED VALIDATION MESSAGE

let message_Owner_Name_Blank = "Name is required"
let message_Owner_Name_NotValid = "Name is invalid"

let message_Title_Blank = "Title is required"
let message_Title_NotValid = "Title is invalid"

let message_Street_Number_Blank = "Street Name is required"
let message_Street_Number_NotValid = "Street Name is invalid"

let message_Street_Name_Blank = "Street Name is required"
let message_Street_Name_NotValid = "Street Name is  invalid"

let message_Apt_Blank = "Apt/suite/unit is required"
let message_Apt_NotValid = "Apt/suite/unit is  invalid"

let message_City_Blank = "City is required"
let message_City_NotValid = "City is invalid"

let message_State_Blank = "State is required"
let message_State_NotValid = "State is invalid"

let message_Zipcode_Blank = "Zipcode is required"
let message_Zipcode_NotValid = "Zipcode is invalid"

let message_HomePhone_Blank = "Home Phone is required"
let message_HomePhone_NotValid = "Home Phone is invalid"

let message_Owner_Email_Blank = "Email is required"
let message_Owner_Email_NotValid = "Email is invalid"

let message_Mobile_Blank = "Mobile is required"
let message_Mobile_NotValid = "Mobile is invalid"

let message_DOB_Blank = "DOB is required"
let message_DOB_NotValid = "DOB is invalid"

let message_Social_Security_Blank = "Social Security is required"
let message_Social_Security_NotValid = "Social Security is invalid"

let message_Percentage_Blank = "Please select Percentage"
let message_Percentage_NotValid = "Please select Percentage"

let message_DriverLicense_Blank = "Driver’s License is required"
let message_DriverLicense_NotValid = "Driver’s License is invalid"

let message_DriverIssuance_Blank = "Driver’s License State or Province of issuance is required"
let message_DriverIssuance_NotValid = "Driver’s License State or Province of issuance is invalid"








