//
//  AppDelegate.swift
//  Garrtech
//
//  Created by Ankit on 12/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginViewController: LoginViewController!
    var messageViewController: BusinessLoanViewController!
    
    var navigationVC: UINavigationController?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.redirectToLoginVC()
        return true
    }

    func redirectToLoginVC() {
        
        
        
        loginViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
 
        
//        let HomeViewControllerOnj = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        
        navigationVC = UINavigationController.init(rootViewController: loginViewController)
        navigationVC?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationVC?.navigationBar.layer.shadowOpacity = 0.7
        navigationVC?.navigationBar.layer.shadowOffset = CGSize.zero
        navigationVC?.navigationBar.layer.shadowRadius = 7
        
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 18)!
        ]
        UINavigationBar.appearance().tintColor = UIColor.lightGray
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
        
        self.window?.rootViewController = navigationVC
 
    }
    func redirectToHoneVC() {
        
        messageViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BusinessLoanViewController") as! BusinessLoanViewController
        
        navigationVC = UINavigationController.init(rootViewController: messageViewController)
        navigationVC?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationVC?.navigationBar.layer.shadowOpacity = 0.7
        navigationVC?.navigationBar.layer.shadowOffset = CGSize.zero
        navigationVC?.navigationBar.layer.shadowRadius = 7
        
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 18)!
        ]
        UINavigationBar.appearance().tintColor = UIColor.lightGray
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
        
        self.window?.rootViewController = navigationVC
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

