//
//  UIView.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIView {
    
    
    class func loadNib<T: UIView>(viewType: T.Type) -> T {
        let className = String.className(aClass: viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
   
    /*
     class func loadNib() -> Self {
        return loadNib(self)
     }
     */
    
    
    
    func setShadowView(width:CGFloat=0.5, height:CGFloat=0.5, Opacidade:Float=0.7, maskToBounds:Bool=false, radius:CGFloat=0.5){
        // SET SHADOW
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    
    func setCornerradius(radius:CGFloat){
        // SET CORNERRADIUS
        self.layer.cornerRadius = radius
        self.clipsToBounds = true 
    }
    
    func setFrameBorder(color:UIColor , width:CGFloat)  {
        // SET BORDER
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        
    }
    func setBluarView() {
        // SET BLUAR VIEW
        let toolbar : UIToolbar = UIToolbar()
        toolbar.frame = self.frame
        toolbar.backgroundColor = UIColor.black
        toolbar.alpha = 0.14
        self.addSubview(toolbar)
    }
  
    func setUpperShadow(radius: CGFloat) {
        // SET UPPER SHADOW
        let viewlayer1 = self.layer
        viewlayer1.shadowOffset = CGSize(width: 0, height: -self.frame.height)
        viewlayer1.shadowColor = UIColor.darkGray.cgColor
        viewlayer1.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        viewlayer1.shadowRadius = radius
        viewlayer1.shadowOpacity = 1.0
    }
 
    func setBottomShadow(radius: CGFloat) {
        // SET BOTTOM SHADOW
        let viewlayer1 = self.layer
        viewlayer1.shadowOffset = CGSize(width: 0, height: frame.height)
        viewlayer1.shadowColor =  UIColor.black.cgColor
        viewlayer1.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        viewlayer1.shadowRadius = radius
        viewlayer1.shadowOpacity = 1.0
    }
    func setDefaultBottomShadow() {
    
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 7
    
    }
    
    func setGradientView(colors: NSArray!, with alpha:CGFloat)  {
        // SET GRADIENT COLOR VIEW
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        // 2
        gradientLayer.frame = self.bounds
        
        
        //3
        var arrayColor : [Any]  = [Any]()
        for i in 0..<colors.count {
            let color  = (colors.object(at: i) as! UIColor).withAlphaComponent(alpha).cgColor as CGColor
            arrayColor.append(color)
        }
        gradientLayer.colors = arrayColor
        
        // 4
        var number : [NSNumber] = [NSNumber]()
        for i in 0..<colors.count {
            let value : Float = Float(1/Float(colors.count)) * Float(i)
            number.append(value as NSNumber)
        }
        gradientLayer.locations = number
        
        // 5
        self.layer.addSublayer(gradientLayer)
        
        
        /*
         gradientLayer.frame = self.bounds
         let color1 = UIColor.yellowColor().CGColor as CGColorRef
         let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).CGColor as CGColorRef
         let color3 = UIColor.clearColor().CGColor as CGColorRef
         let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
         gradientLayer.colors = [color1, color2, color3, color4]
         gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
         self.layer.addSublayer(gradientLayer)
         */
        
    }
   
    
 
    
}
