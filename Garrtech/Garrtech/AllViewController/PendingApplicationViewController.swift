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
    
    @IBOutlet var lblStep1: UILabel!
    @IBOutlet var lblStep2: UILabel!
    @IBOutlet var lblStep3: UILabel!
    @IBOutlet var lblStep4: UILabel!
    
    @IBOutlet var lblStep: UILabel!
    
    let stepTitle = ["Business Information","Company loan","Owner Information","Document list"]
    
    let imhfill = #imageLiteral(resourceName: "circlefill")
    let imgCheck = #imageLiteral(resourceName: "circlecheck")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.doSetUpScreen()
    
        lblStep.text = "\(Int((CurrentUser.sharedInstance.pendingApp?.stepCompleted!)!)! + 1)"
        
        let step = CurrentUser.sharedInstance.pendingApp?.stepCompleted
        
        if step == "0" {
            self.setAllLabel(lbl1: stepTitle[1], lbl2: stepTitle[2], lbl3: stepTitle[3], lbl4: stepTitle[0])
            self.setBtnIng(img1: imhfill, img2: imhfill, img3: imhfill)
            self.setBtnText(str1: "2", str2: "3", str3: "4")
        } else if step == "1" {
            self.setAllLabel(lbl1: stepTitle[0], lbl2: stepTitle[2], lbl3: stepTitle[3], lbl4: stepTitle[1])
            self.setBtnIng(img1: imgCheck, img2: imhfill, img3: imhfill)
            self.setBtnText(str1: "", str2: "3", str3: "4")
        } else if step == "2" {
            self.setAllLabel(lbl1: stepTitle[0], lbl2: stepTitle[1], lbl3: stepTitle[3], lbl4: stepTitle[2])
            self.setBtnIng(img1: imgCheck, img2: imgCheck, img3: imhfill)
            self.setBtnText(str1: "", str2: "", str3: "4")
        } else if step == "3" {
            self.setAllLabel(lbl1: stepTitle[0], lbl2: stepTitle[1], lbl3: stepTitle[2], lbl4: stepTitle[3])
            self.setBtnText(str1: "", str2: "", str3: "")
            self.setBtnIng(img1: imgCheck, img2: imgCheck, img3: imgCheck)
        }
    }
    
    func setAllLabel(lbl1:String, lbl2:String, lbl3:String, lbl4: String) {
        lblStep1.text = lbl1
        lblStep2.text = lbl2
        lblStep3.text = lbl3
        lblStep4.text = lbl4
    }
    
    func setBtnIng(img1:UIImage, img2:UIImage, img3:UIImage) {
        btnStep1.setBackgroundImage(img1, for: .normal)
        btnStep2.setBackgroundImage(img2, for: .normal)
        btnStep3.setBackgroundImage(img3, for: .normal)
    }
    
    func setBtnText(str1:String, str2:String, str3:String) {
        btnStep1.setTitle(str1, for: .normal)
        btnStep2.setTitle(str2, for: .normal)
        btnStep3.setTitle(str3, for: .normal)
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
        super.viewDidAppear(animated)
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
        circleView.animateCircle(duration: 1.0)
    }
    
    @IBAction func pendingApp(sender: UIButton) {
        var viewControllerIdentifire = ""
        
        if CurrentUser.sharedInstance.pendingApp!.isPending! == "Y"{
        
            let step = CurrentUser.sharedInstance.pendingApp?.stepCompleted
            if step == "\(CompleteStep.BusinessInfo.hashValue)"  {
                viewControllerIdentifire = "BusinessLoanViewController"
            } else if step == "\(CompleteStep.CompanyInfo.hashValue)"  {
                viewControllerIdentifire = "CompanyLoanViewController"
            } else if step == "\(CompleteStep.OwnerInfo.hashValue)"  {
                viewControllerIdentifire = "OwnerVc"
            } else if step == "\(CompleteStep.DocList.hashValue)"  {
                viewControllerIdentifire = "DocumentListViewController"
            } else {
                viewControllerIdentifire = "shortLoanVc"
            }
        } else {
            viewControllerIdentifire = "shortLoanVc"
        }
        pushTo(viewController: viewControllerIdentifire)
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
