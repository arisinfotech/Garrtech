//
//  ProfileVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class ProfileVc: BaseViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
  
    @IBOutlet var txt_UserFirstName : AITextFieldSquare!
    @IBOutlet var txt_UserLastName : AITextFieldSquare!
    
    @IBOutlet var txt_UserEmail : AITextFieldSquare!
    
    @IBOutlet var profileImage: UIImageView!
    var profile = Profile()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.doSetUpScreen()
        
    }
    override func viewDidLayoutSubviews() {
     
        profileImage.setCornerradius(radius: profileImage.frame.height/2)
        profileImage.setFrameBorder(color: UIColor.lightGray, width: 0.5)
        
    }
    
    // MARK: - ALL FUNCTIONS
    
    func doSetUpScreen()  {
        
        self.title = "PROFILE"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        self.setRightSideButtonWithImage(Name: "save.png", selector: #selector(self.btn_SaveClick))
        
        let tapGeature = UITapGestureRecognizer.init(target: self, action: #selector(self.selectImageFromPhotoLibrary(_:)))
        self.profileImage.addGestureRecognizer(tapGeature)
        self.profileImage.isUserInteractionEnabled = true
        
        
        // Do any additional setup after loading the view.
        
        txt_UserFirstName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserLastName.textFieldValidationType = .Name_NOSPACE

        txt_UserLastName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserLastName.textFieldValidationType = .Name_NOSPACE
        
        txt_UserEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserEmail.textFieldValidationType = .Email
        
        txt_UserEmail.isUserInteractionEnabled = false
        
        txt_UserFirstName.text = CurrentUser.sharedInstance.first_name!
        txt_UserLastName.text =  CurrentUser.sharedInstance.last_name!
        
        txt_UserEmail.text = CurrentUser.sharedInstance.email
        
        self.profileImage.downloadedFrom(link: "\(CurrentUser.sharedInstance.image!)")
        
    }
    func btn_SaveClick() {
        
        if  TextValidation.isValidate(textField: txt_UserFirstName , validationType:.AI_VALIDATION_TYPE_NAME) {
            if  TextValidation.isValidate(textField: txt_UserLastName , validationType:.AI_VALIDATION_TYPE_NAME) {
                if TextValidation.isValidate(textField: txt_UserEmail, validationType: .AI_VALIDATION_TYPE_EMAIL) {
                    self.call_UpdateProfileAPI()
                }
            }
        }
        
    }
    
    func call_UpdateProfileAPI() {
        
        profile.image = self.profileImage.image!
        profile.first_name = self.txt_UserFirstName.text!
        profile.last_name = self.txt_UserLastName.text!
        profile.email = self.txt_UserEmail.text!
        profile.user_id = CurrentUser.sharedInstance.id!
        showHUD()
        
        APIManager.sharedInstance.UpdateProfile(profile: profile) { (user:Profile?, error:NSError?) in
            
            hideHUD()
            
            if error == nil {
                
            } else {
                
            }
            
        }
    }
    
    
    // MARK: -  PICKERVIEW DELEGET
    
    func presentPickerView(camera: Bool)  {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = camera ? .camera : .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
     //   profileImage.image = originalImg;
        
        
        // Set photoImageView to display the selected image.
                
        self.dismiss(animated: true) { 
            self.profileImage.image = selectedImage
        }
    
    }
    
    // MARK: - ALL ACTIONS
    
    @IBAction func btn_PasswordChange(_ sender: AnyObject) {
        
        pushTo(viewController: "ChangePasswordViewController")
        
    }
    
    @IBAction func btnLogoutPress() {
        
        if Reachability.sharedInstance.isReachable() {
            Alert.displayAlert(title: APP_NAME, message: "Are you sure you want to logout?", otherButtonTitles: ["NO","YES"], preferredAlertStyle: .alert) { (index:Int) in
                if index == 1 {
                    
                    showHUD()
                    APIManager.sharedInstance.LogoutUser { (error:NSError?) in
                        
                        hideHUD()
                        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        appDelegate.navigationVC = UINavigationController.init(rootViewController: loginVC)
//                        appDelegate.navigationVC?.isNavigationBarHidden = true
                        UIView.transition(with: appDelegate.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                            appDelegate.window?.rootViewController = appDelegate.navigationVC
                            }, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        
        
        
        let optionMenu = UIAlertController(title: "Select From", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let option1 = UIAlertAction(title: "Camera", style: .default, handler: {
            
            (alert: UIAlertAction!) -> Void in
            self.presentPickerView(camera: true)
        })
        
        let option2 = UIAlertAction(title: "Select from Photos", style: .default, handler: {
            
            (alert: UIAlertAction!) -> Void in
            self.presentPickerView(camera: false)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(option1)
        optionMenu.addAction(option2)
        optionMenu.addAction(cancelAction)
        
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad )
        {
            if let currentPopoverpresentioncontroller = optionMenu.popoverPresentationController{
                currentPopoverpresentioncontroller.sourceView = profileImage
                currentPopoverpresentioncontroller.sourceRect = profileImage.bounds;
                currentPopoverpresentioncontroller.permittedArrowDirections = UIPopoverArrowDirection.up;
                self.present(optionMenu, animated: true, completion: nil)
            }
        }else{
            self.present(optionMenu, animated: true, completion: nil)
 
        }
 
        
       /*
        Alert.displayAlertWithMessage(message: "Select From", otherButtonTitles: ["Camera","Select from Photos","Cancel"], preferredAlertStyle: .actionSheet) { (
            select) in
            
            if select  == 0{
                
                self.presentPickerView(camera: true)
                
            }
            else if select == 1{
                self.presentPickerView(camera: false)
                
            
            }else{
            
            }
        }
 */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
