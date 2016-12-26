//
//  TermsAndConditionVC.swift
//  Garrtech
//
//  Created by GovindRavaliya on 11/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class TermsAndConditionVC: UIViewController {

    
    @IBOutlet var webViewObj: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.showNavigationBar()
        self.setAppearanceOfNavigationBar(navCont: self.navigationController!)
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.dismissTo))
        self.title = "TERMS & CONDITIONS"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
