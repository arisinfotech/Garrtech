//
//  Alert.swift
//  SwiftDemo
//
//  Created by Aris-mac on 10/10/16.
//  Copyright © 2016 Aris. All rights reserved.
//

import UIKit


let cancelButtonIndex = 1000

class Alert: NSObject {

    class func displayErrorDevMessage(str: String) {
        self.displayAlert(title: APP_NAME, message: str, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
    }
    
    class func displayAlertFromController(controller: UIViewController, withTitle: String, message: String?, otherButtonTitles: NSArray?, isOkayButton: Bool, preferredAlertStyle: UIAlertControllerStyle, withComplition: ((_ index: Int) -> Void)?){
    
        let alertController = UIAlertController(title: withTitle, message: message, preferredStyle: preferredAlertStyle)
        
        if otherButtonTitles != nil {
            for button in otherButtonTitles! {
                let actionToBeAdded = UIAlertAction(title: button as? String, style: .default, handler: { (action) in
                    if withComplition != nil {
                        withComplition!(otherButtonTitles!.index(of: button))
                    }
                })
                alertController.addAction(actionToBeAdded)
            }
        }
        else{
        
            if preferredAlertStyle == .alert {
                let okayAction = UIAlertAction(title: isOkayButton ? "Okay" : "Cancel", style: .default, handler: { (action) in
                    if withComplition != nil {
                        withComplition!(cancelButtonIndex)
                    }
                })
                alertController.addAction(okayAction)
            }else{
            
                let okayAction = UIAlertAction(title: isOkayButton ? "Okay" : "Cancel", style: .default, handler: nil)
                alertController.addAction(okayAction)
            }
       }
       
        controller.present(alertController, animated: true) {}
    }
    
    class func displayAlert(title: String, message: String, otherButtonTitles otherTitles: NSArray?, preferredAlertStyle style: UIAlertControllerStyle, withCompletion completion: ((_ index: Int) -> Void)?) {
       
        self.displayAlertFromController(controller: (appDelegate.window?.rootViewController)!, withTitle: title, message: message, otherButtonTitles: otherTitles, isOkayButton: true, preferredAlertStyle: style, withComplition: completion)
    }
  
    class func displayAlertWithMessage(message: String, otherButtonTitles otherTitles: NSArray?, preferredAlertStyle style: UIAlertControllerStyle, withCompletion completion: ((_ index: Int) -> Void)?) {
        
        self.displayAlert(title: APP_NAME, message: message, otherButtonTitles: otherTitles, preferredAlertStyle: style, withCompletion: completion)
    }
    
    class func displayAlertWithCancel(title: String, message: String, otherButtonTitles otherTitles: NSArray?, preferredAlertStyle style: UIAlertControllerStyle, withCompletion completion: ((_ index: Int) -> Void)?) {
       
        self.displayAlertFromController(controller: (appDelegate.window?.rootViewController)!, withTitle: title, message: message, otherButtonTitles: otherTitles, isOkayButton: false, preferredAlertStyle: style, withComplition: completion)
    }
    
    class func displayAlertCancelWithMessage(message: String, otherButtonTitles otherTitles: NSArray?, preferredAlertStyle style: UIAlertControllerStyle, withCompletion completion: ((_ index: Int) -> Void)?) {
      
        self.displayAlertWithCancel(title: APP_NAME, message: message, otherButtonTitles: otherTitles, preferredAlertStyle: style, withCompletion: completion)
    }

    class func noInternet(openSetting: Bool) {

        self.displayAlertWithMessage(message: message_noInternetAvailable, otherButtonTitles:openSetting ?  ["Settings"] : nil, preferredAlertStyle: .alert) { (index) in
            if index == 0 {
                if openSetting == true{
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(NSURL.init(string: UIApplicationOpenSettingsURLString) as! URL, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                    }
                        }
                    }
            }
    }
    
    class func displayUnderDevMessage() {
        self.displayAlert(title: APP_NAME, message: "This Functionlity is under development", otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
    }
    
    class func displayInvalidApiKey() {
        self.displayAlert(title: APP_NAME, message: "Invalid Api Key", otherButtonTitles: ["OK"], preferredAlertStyle: .alert) { (tag) in
            let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            appDelegate.clearUserDefault()
            appDelegate.navigationVC = UINavigationController.init(rootViewController: loginVC)
            //                        appDelegate.navigationVC?.isNavigationBarHidden = true
            UIView.transition(with: appDelegate.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                appDelegate.window?.rootViewController = appDelegate.navigationVC
                }, completion: nil)

        }
    }
    
    class func notImplemented() {
     
        self.displayAlertWithMessage(message: message_featureNotImplemented, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
    }
    
    class func displayErrorMessage(response:NSError) {
        
        print("---CODE",response.code);
        //        print("---Domain",response.domain);
        //        print("---USER INFO",response.userInfo);
        //        print("---LOCAL DES",responseDescription);
        
        if response.code == -1009 {
            self.noInternet(openSetting: false)
        }else{
            self.notImplemented()
        }
       
    }
    
    
}

let message_noInternetAvailable = "Internet connection is not available. Please check your internet connection and try again."

let message_featureNotImplemented = "Feature not implemented. Please refer to release notes and / or concern the development team. Thanks!"
