//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit


extension UIViewController {
  
    
    
    /*
    var sideMenuViewController: AKSideMenu? {
        get {
            var iter : UIViewController = self.parent!
            while (iter != nibName) {
                if (iter.isKindOfClass(AKSideMenu)) {
                    return (iter as! AKSideMenu)
                } else if (iter.parent != nil && iter.parent != iter) {
                    iter = iter.parent!
                }
            }
            return nil
        }
        set(newValue) {
            self.sideMenuViewController = newValue
        }
    }
    */
    
    func setSideViewController(viewControllerName:String) {
        
        /*
         self.sideMenuViewController!.setContentViewController(UINavigationController.init(rootViewController: self.storyboard!.instantiateViewControllerWithIdentifier(viewControllerName)), animated: true)
         self.sideMenuViewController!.hideMenuViewController()
         
         */
    }
    
    /*
    func showHUD() {
        JTProgressHUD.show()
    }
    
    func hideHUD() {
        JTProgressHUD.hide()
    }
    */
 
    func statusBarLight(isLight: Bool) {
        UIApplication.shared.statusBarStyle = isLight ? .lightContent : .default
    }
    func removeNavigationBarItem() {
       self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    }
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setAppearanceOfNavigationBar(navCont : UINavigationController)
    {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        self.statusBarLight(isLight: true)
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.black,NSFontAttributeName: UIFont.Font_Helvetica_Thin(fontSize: 18)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.7
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize.zero
        self.navigationController?.navigationBar.layer.shadowRadius = 7
  
//        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = item
        
    }
    
    func setTranslucentOfNavigationBar(navCont : UINavigationController)
    {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func hideBottomLine() {
        
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    func setDefaultLeftSideButtonWithImage() {
   
        self.setLeftSideButtonWithImage(Name: "menu", selector:#selector(self.presentLeftMenuViewController(sender:)))
    }
    
    func setDefaultLeftSideButtonWithTitle() {
    
        self.setLeftSideButtonWithTitle(Name: "menu",selector: #selector(self.presentLeftMenuViewController(sender:)))
    }
    
    
    
    //MARK: Add Left NavigationBar Button
    //MARK:-----
    func setLeftSideButtonWithImage(Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Name), style: .plain, target: self, action: selector)
        }
    }
    
    func setLeftSideButtonWithTitle(Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title:Name.localized, style: UIBarButtonItemStyle.plain, target: self, action: selector)
           
        }
    }
    
    //MARK: Add Right NavigationBar Button
    //MARK:------
    func setRightSideButtonWithImage(Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Name), style: .plain, target: self, action: selector)
        }
    }
    func setRightSideButtonWithTitle(Name : String, selector : Selector) {
        if (self.navigationController != nil) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title:Name.localized, style: UIBarButtonItemStyle.plain, target: self, action: selector)
            
        }
    }
    
    
    func setTwoRightSideButtonWithImage(btn1Name : String , selector1 : Selector,btn2Name : String , selector2 : Selector) {
        
        if (self.navigationController != nil) {
            
            let btn_1 : UIBarButtonItem =  UIBarButtonItem(image: UIImage(named: btn1Name), style: .plain, target: self, action: selector1)
            let btn_2 : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: btn2Name), style: .plain, target: self, action: selector2)
            let buttons : NSArray = [btn_1, btn_2]
            
            self.navigationItem.rightBarButtonItems = buttons as? [UIBarButtonItem]
       }
    }
   
    
    
    
    // MARK: - Public
    // MARK: - IB Action Helper methods
    
    @IBAction public func presentLeftMenuViewController(sender: AnyObject!) {
       // self.sideMenuViewController!.presentLeftMenuViewController()
    }
    
    @IBAction public func presentRightMenuViewController(sender: AnyObject!) {
      //  self.sideMenuViewController!.presentRightMenuViewController()
        
    }
    
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: - NAVIAGATE FUNCTION
    
    func pushTo(viewController:String) {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: viewController))!, animated: true)
    }
    func popTo() {
        self.navigationController!.popViewController(animated: true)
    }
    func popToRoot() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    func presentTo(viewController: String) {
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: viewController)
        let navController = UINavigationController(rootViewController: VC1!)
        self.present(navController, animated:true, completion: nil)
    }
    
    func dismissTo() {
        self.navigationController?.dismiss(animated: true, completion: {})
    }
    
}
