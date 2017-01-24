//
//  DocumentListViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit


let ktax_report = "tax_report"
let kdriver_licence = "driver_licence"
let kback_statement = "bank_statement"
let kcredit_crd_statement = "credit_crd_statement"
let kprove_ownership = "prove_ownership"
let klandlord_lease_cotract = "landlord_lease_cotract"
let kcompany_void_check = "company_void_check"
let kmortage_statement_balance = "mortage_statement_balance"

let ktax_report_doc = "tax_report_doc"
let kdriver_licence_doc = "driver_licence_doc"
let kbank_statement_doc = "bank_statement_doc"
let kcredit_crd_statement_doc = "credit_crd_statement_doc"
let kprove_ownership_doc = "prove_ownership_doc"
let klandlord_lease_cotract_doc = "landlord_lease_cotract_doc"
let kcompany_void_check_doc = "company_void_check_doc"
let kmortage_statement_balance_doc = "mortage_statement_balance_doc"


var selectedKey : String = String()


class DocumentListViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    
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
//    var cell_Document : cellDocument! = cellDocument()
    
    var arraySelectedImage: NSMutableArray = NSMutableArray()
    
    var IDARR = [String]()
    
    var stepFour = LoanStepFour()
    var isNext: Bool! = false
    
    
    @IBOutlet var obj_collectionView: UICollectionView!
    
    @IBOutlet var scrollObj: UIScrollView!
    var strArr = [String]()
    
    @IBOutlet var scrollviewPropotionalHeightObj: NSLayoutConstraint!
    
    
   /// @IBOutlet var view_Upper: UIView! = UIView()
    
    // MARK: -
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        if isNext != true
        {
            if CurrentUser.sharedInstance.pendingApp?.isPending == "Y" {
                
                APIManager.sharedInstance.getStepFourData(appID: (CurrentUser.sharedInstance.pendingApp?.applicationID)!, stepId: "4", completion: { (loanData:LoanStepFour?, error:NSError?) in

                    if error == nil {
                        self.setFillData(loanData: loanData!)
                        self.stepFour.application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
                    }
                })
            }
        }
        
        
        if arraySelectedImage.count > 0
        {
            scrollviewPropotionalHeightObj.constant = UIScreen.main.bounds.size.width / 320 * 43
            self.view.layoutIfNeeded()
            
        }
        else
        {
            scrollviewPropotionalHeightObj.constant = 0
            self.view.layoutIfNeeded()
        }
        
        self.doSetUpScreen()
    }
    
    func setFillData(loanData: LoanStepFour) {
        
        let strDoc = loanData.document_list
        
        if (strDoc?.characters.count)! > 0 {
            strArr = (strDoc?.components(separatedBy: CharacterSet.init(charactersIn: ",")))!
        }
        
        
        self.IDARR = strArr
        print(strArr)
        stepFour.document_list = self.IDARR.joined(separator: ",")
                for str in self.IDARR {
            
            for viewObj in self.scrollObj.subviews as [UIView] {
                if viewObj.tag == 5 {
                    print("nikunj :",viewObj.restorationIdentifier!)
                    print(str)
                    if viewObj.restorationIdentifier! == str {
                        for view in viewObj.subviews as [UIView] {
                            if let btn = view as? UIButton {
                                btn.isSelected = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    func doSetUpScreen() {
        self.title = "DOCUMENT LIST"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.btnBackClick))
        self.setRightSideButtonWithImage(Name: "home.png", selector:  #selector(self.popToRoot))
        self.setCollectionView()
        
    }
    func setCollectionView() {
        
        obj_collectionView.dataSource = self
        obj_collectionView.delegate = self
        obj_collectionView.register(UINib(nibName: "cellDocument", bundle: nil), forCellWithReuseIdentifier: "cellDocument")
//        obj_collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellDocument")
        obj_collectionView.backgroundColor = UIColor.white
        obj_collectionView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arraySelectedImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
       let cell_Document = obj_collectionView.dequeueReusableCell(withReuseIdentifier: "cellDocument", for: indexPath) as! cellDocument
 
        var yourDictionary : NSDictionary! = NSDictionary()
        
        yourDictionary = arraySelectedImage.object(at: indexPath.row) as! NSDictionary
        
        let key = (yourDictionary.allKeys as NSArray).object(at: 0) as! String
        let image = yourDictionary.value(forKey: key) as! UIImage
        
        
        cell_Document.setTagAndImage(Tag: indexPath.row, img:image)
        cell_Document.btn_RemoveImage?.addTarget(self, action: #selector(btn_RemoveImage(_:)), for: .touchUpInside)
        cell_Document.btn_RemoveImage?.tag = indexPath.row
        

        return cell_Document
    }
    
    func btnBackClick() {
        popTo()
    }

    @IBAction func btn_RemoveImage(_ sender: AnyObject) {
        
        var yourDictionary : NSDictionary! = NSDictionary()
        yourDictionary = arraySelectedImage.object(at: sender.tag) as! NSDictionary
        
        let key = (yourDictionary.allKeys as NSArray).object(at: 0) as! String
        
//        print("key",key)
        //let image = yourDictionary.value(forKey: key) as! UIImage
        
        
        let theSubviews : Array = self.scrollObj.subviews //view.subviews
        for view1  in theSubviews {
            
          //  print("view _ ",view1.restorationIdentifier)
            
            let ind  = view1.restorationIdentifier as String!
            
            if !(ind == nil) {
                if "\(ind!)_doc" == key {
                
                   
                    for view2 in view1.subviews {
                        if let btn = view2 as? UIButton {
                            
                            btn.isSelected = false
                            print(btn.tag);
                            
                        }
                    }
                }
            }
            
        }
        
        arraySelectedImage.removeObject(at: sender.tag)
        
//        print(arraySelectedImage)
        
        obj_collectionView.reloadData()
        
        if arraySelectedImage.count > 0
        {
            scrollviewPropotionalHeightObj.constant = UIScreen.main.bounds.size.width / 320 * 43
            self.view.layoutIfNeeded()
            
        }
        else
        {
            scrollviewPropotionalHeightObj.constant = 0
            self.view.layoutIfNeeded()
        }
        
        
       // let tmpButton = self.view.viewWithTag(NSInteger(selectedKey)!) as? UIButton
        
        
    }
    
   
    @IBAction func btnSelectDocument(button: UIButton) {
        
//        var text = ""
//        let viewTmp = button.superview! as UIView
//        
//        for view in viewTmp.subviews as [UIView] {
//            
//            if view is UILabel {
//                text = viewTmp.restorationIdentifier!
//            }
//        }
        
//        if button.isSelected {
//            
//            button.isSelected = false
//            if self.IDARR.contains(text) {
//                if let index = self.IDARR.index(of: text) {
//                    self.IDARR.remove(at: index)
//                }
//            }
//        } else {
//            button.isSelected = true
//            self.IDARR.append(text)
//            
//            self.openPicker(indexTag: button.tag)
//            
//        }
        
//        stepFour.document_list = self.IDARR.joined(separator: ",")
//        print(stepFour.document_list)
        
        
        
        if button.isSelected {
            
          
        } else {
            
            self.openPicker(indexTag: button.tag)
        }
        
        
      
    }
    
    func openPicker(indexTag:NSInteger) {
        
        
        selectedKey = String(indexTag)
        
       // PostNotificatio_REGISTER(viewConroller: self, key: selectedKey, selector:#selector(self.openCamera))
        
        
        ////////////////////////////////////
        
        
        let optionMenu = UIAlertController(title: "Pickup Image", message: "Select image from gallery or camero", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let option1 = UIAlertAction(title: "Camera", style: .default, handler: {
            
            (alert: UIAlertAction!) -> Void in
            self.openCamera()
        })
        
        let option2 = UIAlertAction(title: "Gallery", style: .default, handler: {
            
            (alert: UIAlertAction!) -> Void in
            self.openGallery()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(option1)
        optionMenu.addAction(option2)
        optionMenu.addAction(cancelAction)
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
        {
            if let currentPopoverpresentioncontroller = optionMenu.popoverPresentationController{
                currentPopoverpresentioncontroller.sourceView = view_Upper
                currentPopoverpresentioncontroller.sourceRect = view_Upper.bounds;
                currentPopoverpresentioncontroller.permittedArrowDirections = UIPopoverArrowDirection.up;
                self.present(optionMenu, animated: true, completion: nil)
            }
        }
        else
        {
            self.present(optionMenu, animated: true, completion: nil)
            
        }
        
        
        
        
        
        
        //////////////////////
        
        /*
        Alert.displayAlert(title: "Pickup Image", message: "Select image from gallery or camero", otherButtonTitles: ["Camera","Gallery","Cancel"], preferredAlertStyle: .actionSheet) { (index) in
            
            print(index)
            
            if index == 0 {
                //open camera
            
                self.openCamera()
            }
            else if index == 1 {
                // open gallery
                self.openGallery()
            }
            
        }
 */
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = .camera;
            imag.allowsEditing = true
            self.present(imag, animated: true, completion: nil)
        }
        else{
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = .photoLibrary;
            imag.allowsEditing = true
            self.present(imag, animated: true, completion: nil)
        }
        
    }
    func openGallery()  {
        
        let imag = UIImagePickerController()
        imag.delegate = self
        imag.sourceType = .photoLibrary;
        imag.allowsEditing = false
        self.present(imag, animated: true, completion: nil)
        
    }
    
    // MARK: - picker view deleget
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true) {}
        
        self.getImageAndSetImageinArray(imgae: pickedImage!)
        
    }
    func getImageAndSetImageinArray(imgae:UIImage){
        
        
        var text = ""
        
        
        let tmpButton = self.view.viewWithTag(NSInteger(selectedKey)!) as? UIButton
        tmpButton?.isSelected = true
        
        let viewTmp = (tmpButton?.superview!)! as UIView
        for view in viewTmp.subviews as [UIView] {
            if view is UILabel {
                text = viewTmp.restorationIdentifier!
            }
        }
                
        self.IDARR.append(text)
        stepFour.document_list = self.IDARR.joined(separator: ",")
        
       
        let dict = [
            "\(text)_doc" : imgae
        ] as AnyObject
        
        print(dict)
        
        arraySelectedImage.add(dict)
        
        self.obj_collectionView.reloadData()
        
        if arraySelectedImage.count > 0
        {
            scrollviewPropotionalHeightObj.constant = UIScreen.main.bounds.size.width / 320 * 43
            self.view.layoutIfNeeded()
            
        }
        else
        {
            scrollviewPropotionalHeightObj.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    
    @IBAction func btn_NectClick(_ sender: AnyObject) {
        
        let btn = sender as! UIButton
        
        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        
        if self.IDARR.count == 0
        {
            Alert.displayAlertWithMessage(message: "Please select atleast one document", otherButtonTitles: nil, preferredAlertStyle: UIAlertControllerStyle.alert, withCompletion: nil)
        }
        else
        {
            if btn.tag == 1
            {
                
            } else {
                stepFour.submit_type = "next"
            }
            
            stepFour.user_id = CurrentUser.sharedInstance.id
            
            stepFour.application_id = CurrentUser.sharedInstance.pendingApp?.applicationID!
            APIManager.sharedInstance.loanStepFour(stepFour: stepFour,arrStoreDict: arraySelectedImage) { (error:NSError?) in
                if error == nil {
                    if btn.tag == 1 {
                        self.popToRoot()
                    } else {
                        self.messageViewScreen()
                    }
                }
            }
        }
    }
    
    
    func messageViewScreen()  {
        pushTo(viewController: "MessageViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

   
}
