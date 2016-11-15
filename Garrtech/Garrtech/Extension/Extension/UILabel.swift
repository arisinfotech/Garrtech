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
    
    func textRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    
    
    
    
  
    func AttributFont(font:UIFont ) -> [String : AnyObject] {
        
        return   [NSFontAttributeName :font]
        
    }
    

    
    

    
}
