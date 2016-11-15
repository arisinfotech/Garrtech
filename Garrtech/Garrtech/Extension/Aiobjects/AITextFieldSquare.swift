//
//  AITextField.swift
//  SwiftStructureDemo
//
//  Created by Aris-mac on 05/07/16.
//  Copyright © 2016 Aris-mac. All rights reserved.
//

import UIKit

enum AITextFieldValidationType_Square : Int {
    
    case Text
    case Text_NOSPACE
    
    case Text_Number
    case Text_Number_NOSPACE
    
    case Text_Characters
    case Text_Characters_NOSPACE
    
    case Name
    case Name_NOSPACE
    
    case Phone
    case Number
    case Number_Nozero
    
    case Email
    case Password
    
    case CampusSelection
    
}

enum characterset : String {
    
    case Text = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<> "
    case Text_NOSPACE = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>"
    
    case Text_Number = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "
    case Text_Number_NOSPACE = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    case Text_Characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<> "
    case Text_Characters_NOSPACE = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<>"
    
    case Name = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
    case Name_NOSPACE = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    case Phone = "0123456789"
    case Number = "1234567890"
    case Number_Nozero = "123456789"
    
    
    
}

class AITextFieldSquare: UITextField, UITextFieldDelegate {
    
    var strValidationMessage : String = String()
    var strPlaceHolder : String = String()
    var strRightImageName : String = String()
   
    var maxLength : NSInteger?
    var minLength : NSInteger?
    
    var cornerRadius : CGFloat = 7.0
    
    // textfiled validation type
    var txtType : AITextFieldValidationType_Square?
    var textFieldValidationType :AITextFieldValidationType_Square {
        get {
            return self.textFieldValidationType
        }
        set {
            txtType = newValue
        }
    }
    
   
    //MARK:- LIFE CYLCLE
    //MARK:-
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.fixUI()
    }
    
   
    
    //MARK:- LENGHT VALIDATION
    //MARK:
    func setUpTextFieldForLengthValidation(minLength : NSInteger, maxLength : NSInteger) {
        self.maxLength = maxLength
        self.minLength = minLength
    }
    
    func setupUI() {
        
        //DELEGATE
        self.delegate = self
      
        //VALIDATIONS
        if (self.minLength == nil) {
            self.minLength = 0
        }
        
        if (self.maxLength == nil  || self.maxLength == 0) {
            self.maxLength = 256
        }

        // SET FONT
        self.font = UIFont.Font_Helvetica_Regular(fontSize: self.font!.pointSize)
        
        // CALL CHANGE TEXT
        self.addTarget(self, action: #selector(self.textFieldEditChange(textField:)), for: .editingChanged)
        
        // CALL CHANGE TEXT
        self.setupBorderTextFiled()
        
        // SET CORNER RADIUS
        self.layer.cornerRadius = cornerRadius

        // SET TEXTFILED COLOR
        self.textColor = UIColor.Color_LightGray()
        
        
        
    }
    
    func fixUI()  {
        if self.placeholder != nil
        {
            if ((self.placeholder?.length)!>0) {
                self.attributedPlaceholder = NSAttributedString(string: self.placeholder!.localized ,attributes:[NSForegroundColorAttributeName: self.setPlaseHoderColor()])
            }
        }
        
        
    }
    
    func updateTextFiled()  {
        self.setupBorderTextFiled()
    }
   
    
    
    
    
    
    
     func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        if action == #selector(self.paste) {
            return false
        }
        if action == #selector(self.select) {
            return false
        }
        if action == #selector(self.selectAll) {
            return false
        }
        if action == #selector(self.copy(_:)) {
            return false
        }
        if action == #selector(self.cut(_:)) {
            return false
        }
        if action == #selector(self.delete(_:)) {
            return false
        }
        return true
    }
    
   
    
  
    // MARK: ________________________ AITextField Delegate ________________________
    
    //AITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldEditChange(textField : UITextField) -> Void {
        self.setupBorderTextFiled()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            textField.keyboardType = UIKeyboardType.default
            textField.autocapitalizationType = .words;  //UITextAutocapitalizationTypeWords;
        }
        else if txtType == .Phone ||
            txtType == .Number ||
            txtType == .Number_Nozero{
          
            textField.keyboardType = UIKeyboardType.phonePad
        }
        else if txtType == .Email {
            textField.keyboardType = UIKeyboardType.emailAddress
        }
        else if txtType == .Password {
            textField.keyboardType = UIKeyboardType.numbersAndPunctuation
            textField.isSecureTextEntry = true
        }
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        
        // CHANGE COLOR
        
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let trimmedString = textField.text!.trimmingCharacters(in: .whitespaces)
        textField.text = trimmedString
        
        // CHECK AND RESET TEXTFILED
        self.setupBorderTextFiled()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && (string == " ") {
            return false
        }
        
        if self.maxLength != 0 {
            if range.location >= self.maxLength! {
                return false
            }
        }
        
        self.checkEmoji(string: string)
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            return self.checkTextBlock(textField: textField, range: range, string: string)
        }
        else if txtType == .Phone ||
                txtType == .Number ||
                txtType == .Number_Nozero{
            
            return self.checkNumberBlock(textField: textField, range: range, string: string)
        }
        else if txtType == .Email ||
                txtType == .Password {
            
            return self.checkEmailAndPasswordBlock(textField: textField, range: range, string: string)
        }
       
        return true
    }
    
    
    
    // MARK: ________________________ ALL VALIDATION  ________________________
    
    func checkTextBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        
        if txtType == .Text{
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text.rawValue)
        }
        else if txtType == .Text_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text_NOSPACE.rawValue)
        }
        else if txtType == .Text_Number{
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text_Number.rawValue)
        }
        else if txtType == .Text_Number_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text_Number_NOSPACE.rawValue)
        }
        else if txtType == .Text_Characters{
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text_Characters.rawValue)
        }
        else if txtType == .Text_Characters_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Text_Number_NOSPACE.rawValue)
        }
        else if txtType == .Name {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Name.rawValue)
        }
        else if txtType == .Name_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Name_NOSPACE.rawValue)
        }
       
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        let length: Int = textField.text!.characters.count
        if length > 0 {
            let originalString: String = textField.text!
            let index: Int = length
            var theCharacter : String = String()
            //          theCharacter = String(originalString[originalString.startIndex.advancedBy(index-1)])
            
            theCharacter = String(originalString[originalString.index(originalString.startIndex, offsetBy: index-1)])
            if theCharacter.hasPrefix(" ") && string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        
        if string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil {
            return true
        }
        else {
            return false
        }
        
        
        
    }
    
    func checkNumberBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Phone{
            charactersToBlock = NSCharacterSet(charactersIn:characterset.Phone.rawValue)
            if (range.location == 0 &&  string == " ") || (range.location == 0 &&  string == "0") {
                return false
            }
        }
        else if txtType == .Number {
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Number.rawValue)
        }
        else if txtType == .Number_Nozero{
            charactersToBlock = NSCharacterSet(charactersIn: characterset.Name_NOSPACE.rawValue)
        }
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if string == ""  {
            return true
        }
        if string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil {
            return true
        }
            
        else {
            return false
        }
        
    }
    
    func checkEmailAndPasswordBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Email || txtType == .Password{
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        if string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil {
            return true
        }
        else {
            return false
        }
        
    }
    
    
    
    
    func checkEmoji(string : String) -> Bool {
        
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        
        for range in emojiRanges {
            for i in range {
                let c = String(describing: UnicodeScalar(i))
                if (string == c) {
                    return false
                }
            }
        }
        
        return true
        
    }
    
    
     // MARK: ________________________ SETUP TEXTFILED ________________________
    
    func setupBorderTextFiled() {
        
        self.borderStyle = UITextBorderStyle.line
        self.layer.borderWidth =  1.0
        
        let length: Int = self.text!.characters.count
        if length > 0 {
            self.setFillBorderColor()
        }else{
            self.setBlankBorderColor()
        }
  
    }
    
    
    // MARK: ________________________  ________________________
    
    
    // placeholder position
    
    func setBlankBorderColor() {
        self.layer.borderColor = UIColor.RGB(R: 156, G: 156, B: 156, A: 1).cgColor
        
    }
    func setFillBorderColor() {
     //   self.layer.borderColor = UIColor.RGB(R: 50, G: 50, B: 50, A: 1).cgColor
        self.layer.borderColor = UIColor.Color_LightGray().cgColor
    }
    func setPlaseHoderColor() -> UIColor {
        return UIColor.RGB(R: 178, G: 178, B: 178, A: 1)
    }
    
   
    
}





