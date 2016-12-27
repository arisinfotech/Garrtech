//
//  UILabel.swift
//  ParkForU
//
//  Created by Binty Shah on 7/5/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        
        let fontName : String = self.font.fontName
        
        self.font = UIFont.Font(name: fontName, fontSize: self.font.pointSize)
        
        
//        NSString *fontName = self.label.font.fontName;
//        CGFloat fontSize = self.label.font.pointSize;
//        
//        self.font = UIFont.Font_Helvetica_Regular(fontSize: self.font.pointSize)
        self.textColor =  UIColor.Color_AppText()
    }

    
    func textRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    
    
    
    
  
    func AttributFont(font:UIFont ) -> [String : AnyObject] {
        
        return   [NSFontAttributeName :font]
        
    }
    

    
    

    
}
