//
//  CompletedStepView.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class CompletedStepView: UIViewController {

    @IBOutlet var btnStep1: UIButton!
    @IBOutlet var btnStep2: UIButton!
    @IBOutlet var btnStep3: UIButton!
    @IBOutlet var btnStep4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnStep1.setBorderAndBG()
        btnStep2.setBorderAndBG()
        btnStep3.setBorderAndBG()
        btnStep4.setBorderAndBG()
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

extension UIButton {
    func setBorderAndBG() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.init(red: 114/255, green: 124/255, blue: 135/255, alpha: 1).cgColor
        self.layer.borderWidth = 1.0
    }    
}

