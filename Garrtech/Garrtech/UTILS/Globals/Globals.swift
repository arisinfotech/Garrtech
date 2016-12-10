//
//  Globals.swift
//  SwiftStructureDemo
//
//  Created by Aris-mac on 04/07/16.
//  Copyright © 2016 Aris-mac. All rights reserved.
//

import Foundation
import UIKit




//MARK:- ________________________ GENERAL ________________________

/*
    SCREEN SIZE
*/

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH  = UIScreen.main.bounds.size.width
let deviceID = UIDevice.current.identifierForVendor!.uuidString

/*
    APP DELEGATE OBJECT
*/
var appDelegate : AppDelegate {
    get {
        return UIApplication.shared.delegate as! AppDelegate
    }
}



func printT(_ items: Any...) {
    
    /*
     DEBUG PRINT MODE
     */
    if _isDebugAssertConfiguration() {
        print(items)
    }
}

// MARK:- ________________________ APP LOADER  ________________________
// MARK:

func showHUD() {
    JTProgressHUD.show()
}

func hideHUD() {
    JTProgressHUD.hide()
}


//MARK:- ________________________ DEVICE CHECK ________________________
//MARK: -
//Check IsiPhone Device
func IS_IPHONE_DEVICE()->Bool{
    return UIDevice.current.userInterfaceIdiom == .phone
}

//Check IsiPad Device
func IS_IPAD_DEVICE()->Bool{
    return UIDevice.current.userInterfaceIdiom == .pad
}

//iPhone 4 OR 4S
func IS_IPHONE_4_OR_4S()->Bool{
    
    if SCREEN_HEIGHT == 480 {   return true }
    else{   return false    }
}

//iPhone 5 OR OR 5C OR 4S
func IS_IPHONE_5_OR_5S()->Bool{
    if SCREEN_HEIGHT == 568 {   return true }
    else{   return false    }
}

//iPhone 6 OR 6S
func IS_IPHONE_6_OR_6S()->Bool{
    
    if SCREEN_HEIGHT == 667 {   return true }
    else{   return false    }
}

//iPhone 6Plus OR 6SPlus
func IS_IPHONE_6P_OR_6SP()->Bool{
    
    if SCREEN_HEIGHT == 736 {   return true }
    else{   return false    }
}


// MARK:- ________________________CEHCK SYSTEM VERSION ________________________
// MARK:

func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
     return UIDevice.current.systemVersion.compare(version,options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
}

// MARK:- ________________________ USER NOTIFICATION ________________________
// MARK:

func PostNotificatio_REGISTER(viewConroller:UIViewController,key:String,selector : Selector) {
    
   NotificationCenter.default.addObserver(viewConroller, selector: selector, name: NSNotification.Name(rawValue: key), object: nil)
}

func PostNotificatio_CALL(key:String) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: key), object: nil)
}

func PostNotificatio_REMOVE(viewConroller:UIViewController,key:String) {
    NotificationCenter.default.removeObserver(viewConroller, name: NSNotification.Name(rawValue: key), object: nil)
}



// MARK:- ________________________ USER DEFAULTS ________________________
// MARK:

func set_UD_VALUE(key: String, value: AnyObject) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func get_UD_VALUE(key: String) -> Any? {
    return UserDefaults.standard.value(forKey: key)
}
func set_UD_BOOL(key: String, value: Bool) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func get_UD_BOOL(key: String) -> Bool? {
    return UserDefaults.standard.bool(forKey: key)
}
func set_UD_INT(key: String, value: NSInteger) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func get_UD_INT(key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}
func set_UD_FLOAT(key: String, value: Float) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func get_UD_FLOAT(key: String) -> Float? {
    return UserDefaults.standard.float(forKey: key)
}
func set_UD_DOUBLE(key: String, value: Double) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func get_UD_DOUBLE(key: String) -> Double? {
    return UserDefaults.standard.double(forKey: key)
}
func remove_UD(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}

//MARK:- ________________________ ALL KEYS ________________________

// NOTIFICATION KEYS

let Notification_DropDown = "callNotificationDropDown"


// API KEYS
let key = "anyKey"
let kPENDINGAPPLICATION = "kPENDINGAPPLICATION"
let kUSERLOGIN          = "user"
let kEmail              = "email"
let kPassword           = "password"
let kDeviceID           = "device_id"
let kOS_type            = "os_type"
let kPush_Token         = "push_token"
let kfirst_name         = "first_name"
let klast_name          = "last_name"
let kIS_confirm         = "is_confirm"
let kApi_key            = "api_key"
let kID                 = "id"
let KUser_id            = "user_id"
let kStatus             = "status"
let kMessage            = "message"
let kData               = "data"
let kSuccess            = "1"
// Change Password
let kOld_password       = "old_password"
let kNew_password       = "new_password"
let kConfirm_password   = "confirm_password"
let kUser_avatar        = "user_avatar"
let kRequired_loan_amount = "required_loan_amount"
let kBusiness_time      = "business_time"
let kAnnual_revenue     = "annual_revenue"
let kCredit_score       = "credit_score"
let kInvoice_business_customers = "invoice_business_customers"
let kLoan_title          = "loan_title"
let kLoan_desc           = "loan_desc"
let kCompletedStep      = "completed_Step"
let kPhone          = "phone"
let kschedule_date_time = "schedule_date_time"
let kDisp_Name      = "disp_name"
let kMin_val        = "min_val"
let kMax_val        = "max_val"
let kType           = "type"
let kannual_revenue = "annual_revenue"
let kcredit_score   = "credit_score"
let kloan_amt_need  = "loan_amt_need"
let ktime_in_business = "time_in_business"

let ac_rec_factor = "ac_rec_factor"
let bankruptcy_allowed = "bankruptcy_allowed"
let profitability_required = "profitability_required"
let sec_pos_allowed = "sec_pos_allowed"
let cc_volume_factor = "cc_volume_factor"

let kLoanType           = "loan_type"

//MARK: ----- Bank Step One -----

let kSubmit_type                = "submit_type"
let kApplication_id             = "application_id"
let KLone_id                    = "loan_type_id"
let kStep1Legal_business_name   = "legal_business_name"
let kstep1Dba_name              = "dba_name"
let kStep1legal_entity          = "legal_entity"
let kStep1Date_business_eslablished = "date_business_eslablished"
let kStep1Business_classification = "business_classification"
let kStep1Physical_address      = "physical_address"
let kStep1Mailing_address       = "mailing_address"
let kStep1Business_phone        = "business_phone"
let kStep1Business_fax          = "business_fax"
let kStep1Business_mobile       = "business_mobile"
let kStep1Business_email        = "business_email"
let kStep1business_website      = "business_website"
let kStep1business_tax_number   = "business_tax_number"
let kStep1Terminal_model        = "terminal_model"
let kStep1property_ownership    = "property_ownership"
let kStep1years_in_control      = "years_in_control"
let kStep1months_in_control     = "months_in_control"
let kStep1Product_sold          = "product_sold"
let kStep1Landlord_company_name = "landlord_company_name"
let kStep1Landlord_contact_name = "landlord_contact_name"
let kStep1Landlord_contact_number   = "landlord_contact_number"
let kStep1rent_payment          = "rent_payment"
let kStep1Bankruptcy_protection  = "bankruptcy_protection"
let kStep1tax_liens_agains_business   = "tax_liens_agains_business"

let kStep1phy_street_num = "phy_street_num"
let kStep1phy_street_name = "phy_street_name"
let kStep1phy_apt = "phy_apt"
let kStep1phy_city = "phy_city"
let kStep1phy_state = "phy_state"
let kStep1phy_zip = "phy_zip"
let kStep1mail_street_num = "mail_street_num"
let kStep1mail_street_name = "mail_street_name"
let kStep1mail_apt = "mail_apt"
let kStep1mail_city = "mail_city"
let kStep1mail_state = "mail_state"
let kStep1mail_zip = "mail_zip"

//MARK: -----  Step Two -----
//MARK:

let kStep2avg_monthly_card_sale = "avg_monthly_card_sale"
let kStep2total_monthly_sale    = "total_monthly_sale"
let kStep2annual_gross_sale     = "annual_gross_sale"
let kStep2desired_funding_amount    = "desired_funding_amount"
let kStep2use_of_funds          = "use_of_funds"
let kStep2is_advance_balance    = "is_advance_balance"
let kStep2held_with             = "held_with"
let kStep2advance_balance       = "advance_balance"

//MARK: ----- Step three -----
//MARK:

let kStep3owner_name            = "owner_name"
let kStep3owner_title           = "owner_title"
let kStep3percentage_of_ownership   = "percentage_of_ownership"
let kStep3home_address          = "home_address"
let kStep3add_street_num         = "add_street_num"
let kStep3add_street_name        = "add_street_name"
let kStep3add_apt               = "add_apt"
let kStep3add_city              = "add_city"
let kStep3add_state             = "add_state"
let kStep3add_zip               = "add_zip"

let kStep3home_phone            = "home_phone"
let kStep3home_mobile_number    = "home_mobile_number"
let kStep3owner_email           = "owner_email"
let kStep3owner_dob             = "owner_dob"
let kStep3social_security_insurance = "social_security_insurance"
let kStep3drivers_licence       = "drivers_licence"
let kStep3drivers_licence_states    = "drivers_licence_states"
let kStep3how_fast_need         = "how_fast_need"
let kStep3how_long_pay_back     = "how_long_pay_back"
//MARK: ----- Step Four Mehtods -----
//MARK:

let kStep4document_list         = "document_list"



//MARK: ----- Pending App -----
//MARK:

let kAPP_Pending = "pending_app"
let kAPP_StepComplete = "step_completed"
let kAPP_IsPending = "is_pending"
let kAPP_application_step = "application_step"



