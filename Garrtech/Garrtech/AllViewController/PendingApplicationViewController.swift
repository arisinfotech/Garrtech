//
//  PendingApplicationViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class PendingApplicationViewController: UIViewController {

    @IBOutlet var btnStep1: UIButton!
    @IBOutlet var btnStep2: UIButton!
    @IBOutlet var btnStep3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnStep1.setBorderAndBG()
        btnStep2.setBorderAndBG()
        btnStep3.setBorderAndBG()
        self.navigationItem.title = "PENDING APPLICATION"
        //16 PENDING APPLICATION
        // Do any additional setup after loading the view.
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
