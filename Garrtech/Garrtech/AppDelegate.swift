//
//  AppDelegate.swift
//  Garrtech
//
//  Created by Ankit on 12/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit
import UserNotifications
import Alamofire

var deviceTokenString = "DeviceToken"
var loanID: String = ""
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var navigationVC: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sleep(3)
        
        Reachability.sharedInstance.checkReachability()
    
        print(UserDefaults.standard.object(forKey: kUSERLOGIN))
        if CurrentUser.sharedInstance.id != nil
        {
           self.redirectToHomeVC()
//        self.redirectToOtherVC()
            //self.redirectToLoginVC()
        }
        else
        {
            self.redirectToLoginVC()
//            self.redirectToOtherVC()
            
        }
        self.registerPushNotification(application)
        return true
    }
        
    func registerPushNotification(_ application: UIApplication) {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                // Enable or disable features based on authorization.
            }
            application.registerForRemoteNotifications()
        } else {
            // Fallback on earlier versions
        }
    }
    
    func redirectToLoginVC() {
        
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationVC = UINavigationController.init(rootViewController: loginVC)
        self.window?.rootViewController = navigationVC
    }
    
    func redirectToHomeVC() {
        
        let HomeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationVC = UINavigationController.init(rootViewController: HomeVC)
        self.window?.rootViewController = navigationVC
    }    
    
    func redirectToOtherVC() {
        
        let objVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DocumentListViewController") as! DocumentListViewController
        navigationVC = UINavigationController.init(rootViewController: objVC)
        self.window?.rootViewController = navigationVC
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
        
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("i am not available in simulator \(error)")
        
    }
    
    
    func clearUserDefault() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        
        
        UserDefaults.standard.removeObject(forKey: kUSERLOGIN)
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

