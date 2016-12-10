//
//  shortLoanVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class shortLoanVc: BaseViewController,UIScrollViewDelegate {
    
    @IBOutlet var lblHeadTitle: UILabel!
    
    
    var loanAmountYouNeed = [LoanOptions]()
    var timeInBusiness = [LoanOptions]()
    var yourAnnualRevenue = [LoanOptions]()
    var yourCraditScor = [LoanOptions]()
    
    @IBOutlet var btnYes: UIButton!
    @IBOutlet var btnNo: UIButton!
    
    @IBOutlet var txtloanAmountObj: AITextFieldSquare!
    @IBOutlet var txtTimeBussiness: AITextFieldSquare!
    @IBOutlet var txtAnnualRevenus: AITextFieldSquare!
    @IBOutlet var txtYourCreditScore: AITextFieldSquare!
    @IBOutlet var scrollViewObj: UIScrollView!
    
    var applyForLoan = ApplyForLoan()
    var drop_ShortLoan: UIDropDown!
    var drop_timeBussiness: UIDropDown!
    var drop_AnnualReveness: UIDropDown!
    var drop_creditScore: UIDropDown!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.doSetUpScreen()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        scrollViewObj.delegate = self
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        PostNotificatio_REMOVE(viewConroller: self, key: Notification_DropDown)
    }
    
    
    // MARK: - ALL FUNCTION
    
    
    func doSetUpScreen() {
        
        self.title = "Apply for loans"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        lblHeadTitle.text=" Find out what you can borrow \n in second "
        
        
        PostNotificatio_REGISTER(viewConroller: self, key:Notification_DropDown, selector: #selector(CloseDropdown))
        
        self.call_LoanOptionAPI()
    }
    
    
    func call_LoanOptionAPI()  {
    
        
        APIManager.sharedInstance.LoanOption(completion: { (amountYouNeed:[LoanOptions], craditScore:[LoanOptions], annualRevenue:[LoanOptions], inBusiness:[LoanOptions]) in
            
            self.loanAmountYouNeed = amountYouNeed
            self.timeInBusiness = inBusiness
            self.yourAnnualRevenue = annualRevenue
            self.yourCraditScor = craditScore
            
            self.txtloanAmountObj.text = self.loanAmountYouNeed[0].disp_name
            self.txtTimeBussiness.text = self.timeInBusiness[0].disp_name
            self.txtAnnualRevenus.text = self.yourAnnualRevenue[0].disp_name
            self.txtYourCreditScore.text = self.yourCraditScor[0].disp_name
            
            self.applyForLoan.annual_revenue = self.yourAnnualRevenue[0].id!
            self.applyForLoan.business_time = self.timeInBusiness[0].id!
            self.applyForLoan.credit_score = self.yourCraditScor[0].id!
            self.applyForLoan.required_loan_amount = self.loanAmountYouNeed[0].id!
            
            
            self.AddDropDownloanAmount(sender: self.txtloanAmountObj, array_Data: self.loanAmountYouNeed)
            self.AddDropDownTimeBussiness(sender: self.txtTimeBussiness, array_Data: self.timeInBusiness)
            self.AddDropDownAnnualRevenus(sender: self.txtAnnualRevenus, array_Data: self.yourAnnualRevenue)
            self.AddDropDownYourCreditScore(sender: self.txtYourCreditScore, array_Data: self.yourCraditScor)
            
            self.applyForLoan.invoice_business_customers = "Y"
            
        }) { (error:NSError?) in
            
        }
    }
    
    func call_ApplyForLoanAPI()  {
        
        applyForLoan.user_id = CurrentUser.sharedInstance.id!
        APIManager.sharedInstance.ApplyForLoan(options: applyForLoan) { (loanDetails:LoanDetails?, error:NSError?) in
            
            if error == nil
            {
                let loanInfo = self.storyboard?.instantiateViewController(withIdentifier: "LoanInformationViewController") as! LoanInformationViewController
                loanInfo.loanDtl = loanDetails!
                self.navigationController?.pushViewController(loanInfo, animated: true)
            }
            
        }
        
        
    }
    
    func AddDropDownloanAmount(sender: UITextField!,array_Data:[LoanOptions])
    {
        drop_ShortLoan = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_ShortLoan.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //        drop_ShortLoan.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        //Default,Bouncing,Classic
        drop_ShortLoan.isloanOption = true
        drop_ShortLoan.loanOptionsArr = array_Data
        drop_ShortLoan.didSelectedLoan { (loan: LoanOptions, index: Int) in
            self.applyForLoan.annual_revenue = loan.id!
            sender.text=loan.disp_name;
            sender.textColor=UIColor.clear
        }
        
        self.scrollViewObj.addSubview(drop_ShortLoan)
    }
    
    func AddDropDownTimeBussiness(sender: UITextField!,array_Data:[LoanOptions])
    {
        
        drop_timeBussiness = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_timeBussiness.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //        drop_timeBussiness.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        //Default,Bouncing,Classic
        drop_timeBussiness.isloanOption = true
        drop_timeBussiness.loanOptionsArr = array_Data
        drop_timeBussiness.didSelectedLoan { (loan: LoanOptions, index: Int) in
            self.applyForLoan.business_time = loan.id!
            sender.text=loan.disp_name;
            sender.textColor=UIColor.clear
        }
        
        self.scrollViewObj.addSubview(drop_timeBussiness)
    }
    
    func AddDropDownAnnualRevenus(sender: UITextField!,array_Data:[LoanOptions])
    {
        
        drop_AnnualReveness = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_AnnualReveness.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //        drop_AnnualReveness.placeholder = "  \(sender.placeholder!)"
        sender.placeholder = ""
        
        //Default,Bouncing,Classic
        drop_AnnualReveness.isloanOption = true
        drop_AnnualReveness.loanOptionsArr = array_Data
        drop_AnnualReveness.didSelectedLoan { (loan: LoanOptions, index: Int) in
            self.applyForLoan.credit_score = loan.id!
            sender.text=loan.disp_name;
            sender.textColor=UIColor.clear
        }
        
        self.scrollViewObj.addSubview(drop_AnnualReveness)
    }
    
    func AddDropDownYourCreditScore(sender: UITextField!,array_Data:[LoanOptions])
    {
        
        drop_creditScore = UIDropDown(frame: CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: sender.frame.width, height: sender.frame.height))
        drop_creditScore.center = CGPoint(x: sender.frame.midX, y: sender.frame.midY)
        //        drop_creditScore.placeholder = "  \(sender.placeholder!)"
        sender.placeholder=""
        
        //Default,Bouncing,Classic
        drop_creditScore.isloanOption = true
        drop_creditScore.loanOptionsArr = array_Data
        drop_creditScore.didSelectedLoan { (loan: LoanOptions, index: Int) in
            self.applyForLoan.required_loan_amount = loan.id!
            sender.text=loan.disp_name;
            sender.textColor=UIColor.clear
        }
        self.scrollViewObj.addSubview(drop_creditScore)
    }
    
    func CloseDropdown()
    {
        if drop_ShortLoan.isSelected == true
        {
            let shortLoan =  drop_ShortLoan.resign()
            print(shortLoan)
        }
        
        if drop_timeBussiness.isSelected == true
        {
            let timeBussiness = drop_timeBussiness.resign()
            print(timeBussiness)
        }
        if drop_AnnualReveness.isSelected == true
        {
            let annuleRevenes = drop_AnnualReveness.resign()
            print(annuleRevenes)
        }
        
        if drop_creditScore.isSelected == true
        {
            let creditScore = drop_creditScore.resign()
            print(creditScore)
        }
    }
    
    // MARK: - All ACTIONS
    
    @IBAction func submitButtonPress(sender: UIButton)
    {
        /*
         pushTo(viewController: "LoanInformationViewController")
         return
         */
        
        if txtloanAmountObj.text?.length != 0
        {
            if txtTimeBussiness.text?.length != 0
            {
                if txtAnnualRevenus.text?.length != 0
                {
                    if txtYourCreditScore.text?.length != 0
                    {
                        self.call_ApplyForLoanAPI()
                    }
                    else
                    {
                        self.DisplayAlert(stringMsg: "Please select your credit score")
                    }
                }
                else
                {
                    self.DisplayAlert(stringMsg: "Please select your annual revenus")
                }
            }
            else
            {
                self.DisplayAlert(stringMsg: "Please select time in a business")
            }
        }
        else
        {
            self.DisplayAlert(stringMsg: "Please select loan amount")
        }
    }
    
    func DisplayAlert(stringMsg:String)
    {
        Alert.displayAlertWithMessage(message: stringMsg, otherButtonTitles: nil, preferredAlertStyle: UIAlertControllerStyle.alert, withCompletion: nil)
    }
    
    @IBAction func btnRadioClicked(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            btnYes.setImage(UIImage(named: "radioon"), for: UIControlState.normal)
            btnNo.setImage(UIImage(named: "radiooff"), for: UIControlState.normal)
            applyForLoan.invoice_business_customers = "Y"
        }
        else
        {
            btnYes.setImage(UIImage(named: "radiooff"), for: UIControlState.normal)
            btnNo.setImage(UIImage(named: "radioon"), for: UIControlState.normal)
            applyForLoan.invoice_business_customers = "N"
        }
        
    }
    
    // MARK:- scrollviewDeleget
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let object1:Bool = drop_ShortLoan.resign()
        print(object1)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
