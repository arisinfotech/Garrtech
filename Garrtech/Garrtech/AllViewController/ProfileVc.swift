//
//  ProfileVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class ProfileVc: BaseViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
  
    @IBOutlet var txt_UserName : AITextFieldSquare!
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
        self.setRightSideButtonWithTitle(Name: "Save", selector: #selector(self.btn_SaveClick))
        
        let tapGeature = UITapGestureRecognizer.init(target: self, action: #selector(self.selectImageFromPhotoLibrary(_:)))
        self.profileImage.addGestureRecognizer(tapGeature)
        self.profileImage.isUserInteractionEnabled = true
        
        
        // Do any additional setup after loading the view.
        
        txt_UserName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserName.textFieldValidationType = .Name
        
        txt_UserEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserEmail.textFieldValidationType = .Email
        
        txt_UserEmail.isUserInteractionEnabled = false
        
        txt_UserName.text = CurrentUser.sharedInstance.first_name! + " " + CurrentUser.sharedInstance.last_name!
        txt_UserEmail.text = CurrentUser.sharedInstance.email
        
        self.profileImage.downloadedFrom(link: "\(CurrentUser.sharedInstance.image)")
        
    }
    func btn_SaveClick() {
        
        if  TextValidation.isValidate(textField: txt_UserName , validationType:.AI_VALIDATION_TYPE_NAME) {
            
            if TextValidation.isValidate(textField: txt_UserEmail, validationType: .AI_VALIDATION_TYPE_EMAIL) {
                
             self.call_UpdateProfileAPI()
            }
        }
        
    }
    
    func call_UpdateProfileAPI() {
        
        APIManager.sharedInstance.UpdateProfile(profile: profile) { (user:Profile?, error:NSError?) in
            
            
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
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
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
                    APIManager.sharedInstance.LogoutUser { (error:NSError?) in
                        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        appDelegate.navigationVC = UINavigationController.init(rootViewController: loginVC)
                        appDelegate.navigationVC?.isNavigationBarHidden = true
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
        
        return
        let actionController = UIAlertController(title: "Select From", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cameraAction = UIAlertAction.init(title: "Camera", style: .default) { (action:UIAlertAction) in
            self.presentPickerView(camera: true)
        }
        
        let libraryAction = UIAlertAction.init(title: "Select from Photos", style: .default) { (action:UIAlertAction) in
            self.presentPickerView(camera: false)
        }
        
        actionController.addAction(cameraAction)
        actionController.addAction(libraryAction)
        
        present(actionController, animated: true, completion: nil)
        
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
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
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
