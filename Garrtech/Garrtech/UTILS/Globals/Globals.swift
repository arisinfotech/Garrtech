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

let key = "anyKey"






