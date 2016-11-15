//
//  CompanyLoanViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class CompanyLoanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "COMPANY INFORMATION"
        let viewCompleteTask = CompletedStepView(nibName: "CompletedStepView", bundle: nil)
        viewCompleteTask.view.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 120)
        self.view.addSubview(viewCompleteTask.view)
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
