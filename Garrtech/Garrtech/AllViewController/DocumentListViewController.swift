//
//  DocumentListViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class DocumentListViewController: UIViewController {

    enum Document {
        case dTextReport
        case dDriverLicense
        case d6BackStatements
        case d6CraditCardStatemensts
        case dProofOfOwnership
        case dLanclordLeaseContract
        case dComVoidCheck
        case dMort
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "DOCUMENT LIST"
        let viewCompleteTask = CompletedStepView(nibName: "CompletedStepView", bundle: nil)
        viewCompleteTask.view.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 120)
        self.view.addSubview(viewCompleteTask.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSelectDocument(button: UIButton) {
        
        if button.isSelected {
            button.isSelected = false
        } else {
            button.isSelected = true
        }
        
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
