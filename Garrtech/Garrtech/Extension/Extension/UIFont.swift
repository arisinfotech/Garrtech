//
//  UIFont.swift
//  ParkForU
//
//  Created by Binty Shah on 7/4/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit


let Ubuntu_Regular  = "Ubuntu"
let Ubuntu_Light    = "Ubuntu-Light"
let Ubuntu_Bold     = "Ubuntu-Bold"
let Ubuntu_Medium   = "Ubuntu-Medium"

let Helvetica_Regular = "Helvetica"
let Helvetica_Light = "Helvetica-Light"
let Helvetica_Thin = "HelveticaNeue-Thin"
let Helvetica_Bold = "Helvetica-Bold"



extension UIFont  {
    
    class func Font(name : String , fontSize : CGFloat) -> UIFont {
      // return UIFont(name: name, size: PROPORTIONAL_FONT_SIZE(fontSize: fontSize))!
        return UIFont(name: name, size: PROPORTIONAL_FONT_SIZE(fontSize: fontSize))!
        
    }
    

    // SYSTOM FONT
    class func Font_System(fontSize : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize: fontSize))
    }
    class func Font_Bold(fontSize : CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize: fontSize))
    }
    class func Font_Italic(fontSize : CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize: fontSize))
    }
    
    
    // CUSTOM FONT
    class func Font_Ubuntu_Regular(fontSize : CGFloat) -> UIFont {
        return  Font(name: Ubuntu_Regular, fontSize: fontSize)
    }
    class func Font_Ubuntu_Light(fontSize : CGFloat) -> UIFont {
        return  Font(name: Ubuntu_Light, fontSize: fontSize)
    }
    class func Font_Ubuntu_Bold(fontSize : CGFloat) -> UIFont {
        return  Font(name: Ubuntu_Bold, fontSize: fontSize)
    }
    class func Font_Ubuntu_Medium(fontSize : CGFloat) -> UIFont {
        return  Font(name: Ubuntu_Medium, fontSize: fontSize)
    }
    
    // APP FONTS
    class func Font_Helvetica_Regular(fontSize : CGFloat) -> UIFont {
        return  Font(name: Helvetica_Regular, fontSize: fontSize)
    }
    class func Font_Helvetica_Light(fontSize : CGFloat) -> UIFont {
        return  Font(name: Helvetica_Light, fontSize: fontSize)
    }
    class func Font_Helvetica_Bold(fontSize : CGFloat) -> UIFont {
        return  Font(name: Helvetica_Bold, fontSize: fontSize)
    }
    class func Font_Helvetica_Thin(fontSize : CGFloat) -> UIFont {
        return  Font(name: Helvetica_Thin, fontSize: fontSize)
    }
    
    
    //  SET PROPORTIONAL FONT SIZE
    class func PROPORTIONAL_FONT_SIZE(fontSize : CGFloat) -> CGFloat {
        if IS_IPHONE_4_OR_4S()  {   return fontSize-3  }
        else if IS_IPHONE_5_OR_5S() {   return fontSize-2  }
        else if IS_IPHONE_6_OR_6S() {   return fontSize-1 }
        else if IS_IPHONE_6P_OR_6SP(){  return fontSize-0 }
        else { return fontSize+10 }
    }
    
   
    
    
}
