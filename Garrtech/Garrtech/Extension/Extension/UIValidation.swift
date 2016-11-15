//
//  UIValidation.swift
//  ParkForU
//
//  Created by Binty Shah on 7/6/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit

// MARK: Get the size for the label
func sizeForLabel(text:String, font:UIFont, width:CGFloat) -> CGSize
{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byCharWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.size
}

// MARK: Check for Email Validation

func isValidEmail(testStr:String) -> Bool {
    // println("validate calendar: \(testStr)")
    let emailRegEx = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Za-z0-9]+\\.([A-Za-z])*([A-Za-z0-9]+\\.[A-Za-z]{2,4})*"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

// MARK: Check for Phone Validation

func isValidPhone(value: String) -> Bool {
//    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//    let result =  phoneTest.evaluateWithObject(value)
//    return result
    
    return true
}

// MARK: Validation to Check for the Emoji

func containsEmoji(text: String) -> Bool {
    var containsEmoji = false
    for scalar in text.unicodeScalars {
        switch scalar.value {
        case 0x1F600...0x1F64F:
            // Emoticons
            containsEmoji = true
        case 0x1F300...0x1F5FF:
            // Misc Symbols and Pictographs
            containsEmoji = true
        case 0x1F680...0x1F6FF:
            // Transport and Map
            containsEmoji = true
        case 0x2600...0x26FF:
            // Misc symbols, not all emoji
            containsEmoji = true
        case 0x2700...0x27BF:
            // Dingbats, not all emoji
            containsEmoji = true
        default: ()
        }
    }
    return containsEmoji
}

func convertStringToDictionary(json: String) -> [String: AnyObject]? {
    if let data = json.data(using: String.Encoding.utf8) {
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: AnyObject]
        return json
    }
    return nil
}
