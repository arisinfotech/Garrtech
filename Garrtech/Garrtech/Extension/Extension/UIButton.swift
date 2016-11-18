//
//  UILabel.swift
//  ParkForU
//
//  Created by Binty Shah on 7/5/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.customiseButton()
    }
    
    
    func customiseButton() {
        self.titleLabel!.font = UIFont.Font_Helvetica_Regular(fontSize: self.titleLabel!.font.pointSize)
    }
    
    func textRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
}
