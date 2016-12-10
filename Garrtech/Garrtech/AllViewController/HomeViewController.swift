//
//  HomeViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 14/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit
import MessageUI

class HomeViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CAAnimationDelegate  {
    
    
    
    enum CellIndex {
        case NEWAPP,MYAPP,LOANINFO,BIZANYLI,PENDINGAPP,MYPROF
    }
    
    @IBOutlet var collectionViewObj: UICollectionView!
    var selectedImages = NSMutableArray()
    var unSelectedImages = NSMutableArray()
    var cellText = NSMutableArray()
    var indexpathSelected : IndexPath = []
    var checkCellSeleted = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.doSetUpScreen()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -  ALL FUNCTION
    
    func doSetUpScreen()  {
        
        self.showNavigationBar()
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        selectedImages.add("newApplication_select")
        selectedImages.add("myApplication_select")
        selectedImages.add("loan_select")
        selectedImages.add("search_select")
        selectedImages.add("pending_select")
        selectedImages.add("profile_select")
        
        unSelectedImages.add("newApplication_unselect")
        unSelectedImages.add("myApplication_unselect")
        unSelectedImages.add("loan_unselect")
        unSelectedImages.add("search_unselect")
        unSelectedImages.add("pending_unselect")
        unSelectedImages.add("profile_unselect")
        
        cellText.add("NEW APPLICATION")
        cellText.add("MY APPLICATION")
        cellText.add("LOAN INFORMATION")
        cellText.add("BIZ ANALYZER")
        cellText.add("PENDING APPLICATION")
        cellText.add("MY PROFILE")
        
        
        self.title = "GARRTECH FUND"
        
        collectionViewObj.dataSource = self
        collectionViewObj.delegate = self
        
        
    }
    
    // MARK: - UICollectionView Deleget
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionViewObj.dequeueReusableCell(withReuseIdentifier: "HomwViewCell", for: indexPath) as! HomwViewCell
        cell.lblNameObj.text = cellText.object(at: indexPath.row) as? String
        cell.backgroundImageObj.image = nil
        let UnSelectedIconUrl = unSelectedImages.object(at: indexPath.row) as! String
        cell.imgIconObj.image = UIImage.init(named: UnSelectedIconUrl)
        cell.lblNameObj.textColor = UIColor.RGB(R: 118, G: 124, B: 135, A: 1.0)
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.beginAnimations("fadeInNewView", context: nil)
        UIView.setAnimationDuration(1.0)
        cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        cell.alpha = 1.0
        UIView.commitAnimations()
        
        return cell
    }
    
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.width / 2 ) - 20
        let height = collectionView.frame.size.height / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        
//        if indexPath.row != 0 && indexPath.row != 5  {
//            Alert.displayUnderDevMessage()
//            return
//        }
//        
        
        let cell = collectionViewObj.cellForItem(at: indexPath) as! HomwViewCell
        cell.backgroundImageObj.isHidden = false
        let SelectedIconUrl = selectedImages.object(at: indexPath.row) as! String
        cell.lblNameObj.textColor = UIColor.white
        cell.imgIconObj.image = UIImage.init(named: SelectedIconUrl)
        cell.backgroundImageObj.image = UIImage.init(named: "homecell_select")
        
        if checkCellSeleted == true
        {
            let cellSelected = collectionViewObj.cellForItem(at: indexpathSelected) as! HomwViewCell
            cellSelected.backgroundImageObj.image = nil
            cellSelected.lblNameObj.textColor = UIColor.RGB(R: 118, G: 124, B: 135, A: 1.0)
            let UnSelectedIconUrl = unSelectedImages.object(at: indexpathSelected.row) as! String
            cellSelected.imgIconObj.image = UIImage.init(named: UnSelectedIconUrl)
        }
        
        checkCellSeleted = true
        indexpathSelected = indexPath
        
        if indexPath.row == CellIndex.NEWAPP.hashValue {
            
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
            
        } else if indexPath.row == CellIndex.MYAPP.hashValue {
            pushTo(viewController: "MyApplicationListViewController")
        } else if indexPath.row == CellIndex.LOANINFO.hashValue {
            pushTo(viewController: "loanOptionSecondVc")
        } else if indexPath.row == CellIndex.BIZANYLI.hashValue {
            Alert.displayUnderDevMessage()
        } else if indexPath.row == CellIndex.PENDINGAPP.hashValue {
            
            if CurrentUser.sharedInstance.pendingApp?.isPending! == "Y" {
                pushTo(viewController: "PendingApplicationViewController")                
            } else {
                Alert.displayErrorDevMessage(str: "You have no pending application")
            }
            
            
        } else if indexPath.row == CellIndex.MYPROF.hashValue {
            
            pushTo(viewController: "ProfileVc")
            
        }
    }
    
    
    
    
    @IBAction func contactUSPress() {
        
        if !MFMailComposeViewController.canSendMail() {
            
            Alert.displayErrorDevMessage(str: "Mail services are not available please configure email")
            
            print("Mail services are not available")
            return
        }
        else
        {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            composeVC.setToRecipients(["garraffaroberto@hotmail.com"])
            composeVC.setSubject("")
            composeVC.setMessageBody("", isHTML: false)
            
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func schedulePress()
    {
        let sceduleViewObj = self.storyboard?.instantiateViewController(withIdentifier: "SceduleCallViewController") as! SceduleCallViewController
        pushTOVC(controller: sceduleViewObj)
    }
}

extension HomeViewController : MFMailComposeViewControllerDelegate {
    
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
}
