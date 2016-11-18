//
//  AILabel.swift
//  SwiftStructureDemo
//
//  Created by Aris-mac on 04/07/16.
//  Copyright © 2016 Aris-mac. All rights reserved.
//

import UIKit

class AILabel: UILabel {

    
    //MARK: - LIFE CYCLE
    //MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    override func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Helvetica_Regular(fontSize: self.font.pointSize)
    }
    

}

class AILabelRegularBorder: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 3.0, right: 5.0)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        
    }
    
    
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    override func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
       // self.minimumScaleFactor = 0.5
     //   self.font = UIFont.Font_Helvetica_Regular(self.font.pointSize)
    }
    
}





