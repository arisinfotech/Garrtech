//
//  loanOptionSecondVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/19/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class loanOptionSecondVc: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{

    @IBOutlet var lblLoanTitle: UILabel!
    @IBOutlet var lblLoanDescription: UILabel!
    @IBOutlet var lblBussinessRequired: UILabel!
    @IBOutlet var lblRevenue: UILabel!
    @IBOutlet var lblPortabilityRequire: UILabel!
    @IBOutlet var lblBankruptcyallowed: UILabel!
    @IBOutlet var lblCreditCardVolumnFactor: UILabel!
    @IBOutlet var lblAccountsReceivableFactor: UILabel!
    @IBOutlet var lblSecondPositionAllowed: UILabel!
    @IBOutlet var lblCreditScore: UILabel!
    
    
    var loanDtlArr = [LoanDetails]()
    
    @IBOutlet var collectionviewObj: UICollectionView!
    let reuseIdentifier = "loanOption"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var SelectedIndex = NSInteger()
    @IBOutlet var viewHead : UIView!
    @IBOutlet var scrollView : UIScrollView!
    
    @IBOutlet var leadingConstraintOfScrollview: NSLayoutConstraint!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.doSetUpScreen()
    
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        
        showHUD()
        self.scrollView.alpha = 0
        
        APIManager.sharedInstance.getLoanInformation { (detailArr:[LoanDetails]?, error:NSError?) in
        
            hideHUD()
            if error == nil {
                if detailArr!.count > 0 {
                    self.loanDtlArr = detailArr!
                    self.scrollView.alpha = 1
                    self.setDetails(loanDtl: self.loanDtlArr[0])
                }
            } else {
                
            }
        }
    }
    
    
    func setDetails(loanDtl: LoanDetails) {
        
        
        self.scrollView.contentOffset = CGPoint.init(x: 0, y: 0)
        
        lblBussinessRequired.text = loanDtl.kbusinessTime! as String
        lblRevenue.text = loanDtl.kannualRevenue! as String
        lblCreditScore.text = loanDtl.kcraditScore! as String
        lblPortabilityRequire.text = loanDtl.kprofitability_required! as String
        lblBankruptcyallowed.text = loanDtl.kbankruptcy_allowed! as String
        lblCreditCardVolumnFactor.text = loanDtl.kcc_volume_factor! as String
        lblAccountsReceivableFactor.text = loanDtl.kac_rec_factor! as String
        lblSecondPositionAllowed.text = loanDtl.ksec_pos_allowed! as String
        
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
    
    func doSetUpScreen()  {
        
        self.title = "LOAN INFORMATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        collectionviewObj.dataSource=self
        collectionviewObj.delegate=self
        SelectedIndex=0;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionviewObj.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! loanOption
        
        if indexPath.item==SelectedIndex
        {
            cell.viewLine?.backgroundColor=UIColor.init(colorLiteralRed: 118.0/255.0, green: 124.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        }
        else
        {
             cell.viewLine?.backgroundColor=UIColor.white
        }
        
        cell.lbltitle?.text=self.items[indexPath.item]

        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
            return CGSize(width: collectionviewObj.frame.size.width/8, height: collectionviewObj.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        SelectedIndex=indexPath.item
        collectionviewObj.reloadData()
        self.setSelectedIndexDetail()
    }
    
    
    //MARK: - Button Click Event -
    
    @IBAction func btnNextPreviousClick(_ sender: AnyObject)
    {
        
        if items.count == 0 {
            return
        }
        
        if sender.tag==1
        {
            
          //  leadingConstraintOfScrollview
            
            if SelectedIndex>0
            {
                SelectedIndex=SelectedIndex-1;
                collectionviewObj.reloadData()
            }
        }
        else
        {
            if SelectedIndex < items.count-1
            {
                self.SelectedIndex=SelectedIndex+1;
                 collectionviewObj.reloadData()
            }
        }
        self.setSelectedIndexDetail()
    }
    
    
    func setSelectedIndexDetail() {
        for view in scrollView.subviews as [UIView] {
            
            if let label = view as? UILabel {
                UIView.transition(with: label,
                                  duration: 0.25,
                                  options: [.transitionCrossDissolve],
                                  animations: {
                                    
                                    self.setDetails(loanDtl: self.loanDtlArr[self.SelectedIndex])
                                    
                    }, completion: nil)
            }
        }
    }
    

}
