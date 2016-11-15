//
//  OwnerVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class OwnerVc: UIViewController {

    @IBOutlet var btnNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnNext.layer.cornerRadius=5.0;
        btnNext.layer.masksToBounds=true;
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "OWNER PRINCIPAL INFORMATION"
        let viewCompleteTask = CompletedStepView(nibName: "CompletedStepView", bundle: nil)
        viewCompleteTask.view.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 120)
        self.view.addSubview(viewCompleteTask.view)

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
