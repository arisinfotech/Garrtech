//
//  LoanInformationViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class LoanInformationViewController: UIViewController
{
    
    var loanDtl = LoanDetails()
    
    @IBOutlet var lblBussinessRequired: UILabel!
    @IBOutlet var lblRevenue: UILabel!
    @IBOutlet var lblCreditScore: UILabel!
    @IBOutlet var lblPortabilityRequire: UILabel!
    @IBOutlet var lblBankruptcyallowed: UILabel!
    @IBOutlet var lblCreditCardVolumnFactor: UILabel!
    @IBOutlet var lblAccountsReceivableFactor: UILabel!
    @IBOutlet var lblSecondPositionAllowed: UILabel!
    @IBOutlet var lblLoanTitle: UILabel!
    @IBOutlet var lblLoanDescription: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "LOAN INFORMATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        
        lblBussinessRequired.text = loanDtl.kbusinessTime! as String
        lblRevenue.text = loanDtl.kannualRevenue! as String
        lblCreditScore.text = loanDtl.kcraditScore! as String
        lblPortabilityRequire.text = loanDtl.kprofitability_required! as String
        lblBankruptcyallowed.text = loanDtl.kbankruptcy_allowed! as String
        lblCreditCardVolumnFactor.text = loanDtl.kcc_volume_factor! as String
        lblAccountsReceivableFactor.text = loanDtl.kac_rec_factor! as String
        lblSecondPositionAllowed.text = loanDtl.ksec_pos_allowed! as String
    
        loanID = loanDtl.kid!
        if lblBankruptcyallowed.text?.length == 0
        {
            lblBankruptcyallowed.text = "CreditCard"
            lblBankruptcyallowed.isHidden = true
        }
        
        lblBankruptcyallowed.sizeToFit()
        lblBankruptcyallowed.adjustsFontSizeToFitWidth = true
        lblLoanTitle.text = loanDtl.kloanTitle! as String
        
        if loanDtl.kloanDes?.length != 0
        {
            let otherstring = loanDtl.kloanDes
            let new = otherstring?.trimmingCharacters(in: NSCharacterSet.init(charactersIn: "la t, \n \" ':") as CharacterSet)
            lblLoanDescription.text = new
        }
        else
        {
            lblLoanDescription.text = "LoanDescription"
            lblLoanDescription.isHidden = true
        }
        
    }   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnPress() {
        pushTo(viewController: "BusinessLoanViewController")
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
