//
//  MessageViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit
import MessageUI

class MessageViewController: BaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.doSetUpScreen()
        
        
    }
    // MARK: - All Functions
    
    func doSetUpScreen() {
        
        self.title = "APPLICATION SUBMITTED"
        self.navigationItem.hidesBackButton = true
        self.setRightSideButtonWithImage(Name: "home.png", selector:  #selector(self.popToRoot))
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func contactUSPress() {
        if !MFMailComposeViewController.canSendMail() {
            
            Alert.displayErrorDevMessage(str: "Mail services are not available please configure email")
            
            print("Mail services are not available")
            return
        }
        else
        {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            composeVC.setToRecipients(["garraffaroberto@hotmail.com"])
            composeVC.setSubject("")
            composeVC.setMessageBody("", isHTML: false)
            
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
}

extension MessageViewController : MFMailComposeViewControllerDelegate {
    
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
}
