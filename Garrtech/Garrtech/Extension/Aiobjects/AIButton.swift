//
//  AIButton.swift
//  ScarletAndBleu
//
//  Created by Dhaval Nena on 23/05/16.
//  Copyright © 2016 Dhaval Nena. All rights reserved.
//

import UIKit

class AIButtonRound: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		self.commonInit()
	}
	func commonInit() {
        self.titleLabel!.font = UIFont.Font_Italic(fontSize: self.titleLabel!.font.pointSize)
        self.backgroundColor = UIColor.green
        self.setCornerradius(radius: self.frame.height/2);
        self.setShadowView(width: 1, height: 1, Opacidade:10, maskToBounds: false, radius: 2)
        self.setFrameBorder(color: UIColor.red, width: 1.0)
   }
   
    
}

class AIButtonUnderLine: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
        self.titleLabel!.font = UIFont.Font_System(fontSize: self.titleLabel!.font.pointSize)
        self.underlineButton(button: self, text: (self.titleLabel?.text!)!)
    }
    
    func underlineButton(button : UIButton, text: String) {
        
        let titleString : NSMutableAttributedString = NSMutableAttributedString(string: text.localized)
        let myRange = NSRange(location: 0, length: text.characters.count)
        titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: myRange)
        titleString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.Color_LightGray(), range: myRange)
        button.setAttributedTitle(titleString, for: .normal)
    }
    
}

class AIButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		self.commonInit()
	}
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
   
	func commonInit() {
        self.titleLabel!.font = UIFont.Font_System(fontSize: self.titleLabel!.font.pointSize)
    }

    
}





