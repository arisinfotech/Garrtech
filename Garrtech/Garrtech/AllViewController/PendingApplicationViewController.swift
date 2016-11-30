//
//  PendingApplicationViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class PendingApplicationViewController: BaseViewController {
    
    @IBOutlet var btnStep1: UIButton!
    @IBOutlet var btnStep2: UIButton!
    @IBOutlet var btnStep3: UIButton!
    
    @IBOutlet var viewCircle: UIView!
    @IBOutlet var imgViewCenter: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSetUpScreen()
    
    }
    
    func doSetUpScreen() {
     
        self.title = "PENDING APPLICATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        
        btnStep1.setBorderAndBG()
        btnStep2.setBorderAndBG()
        btnStep3.setBorderAndBG()
        
        
    }
    
    override func viewWillLayoutSubviews()
    {
 
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.addCircleView()
    }
    
    func addCircleView()
    {
        // Create a new CircleView
        
        //        let propotionalWidth = CGFloat((UIScreen.main.bounds.size.width / 375) * 152)
        //        print(propotionalWidth)
        
        let frame = CGRect(x: 0, y: 0, width: viewCircle.frame.size.width, height: viewCircle.frame.size.width)
        
        let circleView = outerCircleView(frame: frame)
        
        viewCircle.addSubview(circleView)
        
        // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration: 2.0)
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
