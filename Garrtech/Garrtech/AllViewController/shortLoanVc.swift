//
//  shortLoanVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class shortLoanVc: UIViewController {

    @IBOutlet var lblHeadTitle: UILabel!
    
    @IBOutlet var btnSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblHeadTitle.text=" Find out what you can borrow \n in second "
        
        btnSubmit.layer.cornerRadius=5.0;
        btnSubmit.layer.masksToBounds=true;
        
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
