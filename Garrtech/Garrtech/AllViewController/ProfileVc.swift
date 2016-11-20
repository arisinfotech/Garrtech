//
//  ProfileVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/13/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class ProfileVc: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet var btnChnagePw: UIButton!
    @IBOutlet var btnLogout: UIButton!
    
    @IBOutlet var txt_UserName : AITextFieldSquare!
    @IBOutlet var txt_UserEmail : AITextFieldSquare!
    
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnChnagePw.layer.cornerRadius=5.0;
        btnChnagePw.layer.masksToBounds=true;
        
        btnLogout.layer.cornerRadius=5.0;
        btnLogout.layer.masksToBounds=true;
        
        // Do any additional setup after loading the view.
        
        txt_UserName.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserName.textFieldValidationType = .Name
        
        txt_UserEmail.setUpTextFieldForLengthValidation(minLength: 1, maxLength: 50)
        txt_UserEmail.textFieldValidationType = .Email
        
        txt_UserEmail.isUserInteractionEnabled = false
        
        
    }
    
    
    
    func presentPickerView(camera: Bool)  {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = camera ? .camera : .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        profileImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_PasswordChange(_ sender: AnyObject) {
        
        
        if  TextValidation.isValidate(textField: txt_UserName , validationType:.AI_VALIDATION_TYPE_NAME) {
            
            if TextValidation.isValidate(textField: txt_UserEmail, validationType: .AI_VALIDATION_TYPE_EMAIL) {
                print("success")
            }
        }
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        
        
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
    
    @IBAction func updateProfilePicture(sender: UIButton) {
        
        let profile = Profile()
        
        
        APIManager.sharedInstance.UpdateProfile(profile: profile) { (user:Profile?, error:NSError?) in
            
        }
        
        
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
