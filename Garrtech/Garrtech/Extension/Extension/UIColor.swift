//
//  UIColor.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }

    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(from: 1)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
    
    class func RGB(R:CGFloat,G:CGFloat, B:CGFloat, A:CGFloat) -> UIColor {
        return UIColor(red: R/255, green: G/255, blue: B/255, alpha: A)
    }
    
    class func Color_NavigationBar() -> UIColor {
        return  RGB(R: 206, G: 32, B: 32, A: 1)
    }
    
    class func Color_AppRedColor() -> UIColor {
        return  RGB(R: 206, G: 32, B: 32, A: 1)
    }
    class func Color_AppYellowColor() -> UIColor {
        return  RGB(R: 238, G: 201, B: 48, A: 1)
    }
    class func Color_AppText() -> UIColor {
        return  RGB(R: 113, G: 120, B: 133, A: 1)
    }
    class func Color_AppBackground() -> UIColor {
        return  RGB(R: 246, G: 246, B: 246, A: 1)
    }
    
    // LIGNHT GRAY
    class func Color_LightGray() -> UIColor {
        return  RGB(R: 118, G: 124, B: 136, A: 1)
    }
//    red:118 , Green: 124:, Blue:136
    
    // DARK GRAY
    
    // LIGHT BLACK
    
    
}
