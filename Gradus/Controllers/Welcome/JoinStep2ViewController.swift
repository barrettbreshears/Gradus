//
//  JoinStep2ViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/8/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit
import Parse

class JoinStep2ViewController: GradusViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    // IBOutlets
    @IBOutlet var addImageButton:UIButton!
    @IBOutlet var username:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var usernameErrorLabel:UILabel!
    @IBOutlet var interestsList:TagListView!
    @IBOutlet var createAccountBtn:UIButton!
    
    // properties
    var interests:[Interest] = [Interest]()
    var verifiedEmail:String!
    var imagePickerController:UIImagePickerController?
    var selectedInterests:[Interest] = [Interest]()
    var selectedImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addImageButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        username.addTarget(self, action: Selector("checkUsername"), forControlEvents: UIControlEvents.EditingChanged)
        createAccountBtn.layer.borderColor = UIColor.whiteColor().CGColor
        createAccountBtn.layer.borderWidth = 1
        
        let tapView = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard"))
        self.view.addGestureRecognizer(tapView)
        
        getInterestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.createPurpleGradient()
    }
    
    @IBAction func addImage(){
        
        let cameraAlert = UIAlertController(title: nil, message: "Select image source", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) { (ACTION) -> Void in
            self.loadCamera()
        }
        
        let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) { (action ) -> Void in
            self.loadGallery()
        }
        
        cameraAlert.addAction(cameraAction)
        cameraAlert.addAction(galleryAction)
        
        self.presentViewController(cameraAlert, animated: true, completion: nil)
        
        
    }
    
    func loadCamera(){
        imagePickerController = UIImagePickerController()
        imagePickerController?.delegate = self
        imagePickerController?.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
    
    func loadGallery(){
        imagePickerController = UIImagePickerController()
        imagePickerController?.delegate = self
        imagePickerController?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController!, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        addImageButton.setImage(image, forState: UIControlState.Normal)
        self.selectedImage = image
        
    }
    
    func checkUsername(){
        let user = username.text
        
        if user?.characters.count > 4 {
            
            let query = PFQuery(className:"User")
            query.whereKey("username", equalTo: user!)
            query.findObjectsInBackgroundWithBlock({ (users, error ) -> Void in
                
                if users?.count > 0 {
                    
                    self.usernameErrorLabel.hidden = false
                    self.usernameErrorLabel.text = "Username already taken"
                    
                }else{
                    
                    self.usernameErrorLabel.hidden = true
                    
                }
                
            })
            
        }
    }
    
    // MARK: - collection view methods
    func getInterestData(){
        
        let query = PFQuery(className: "Interest")
        query.findObjectsInBackgroundWithBlock { (interests, error) -> Void in
            
            if error != nil {
                self.showWarning("Uh oh!", warningMessage: "Unable to grab interests at this time :(")
            }else{
                
                self.interests = interests as! [Interest]
                self.addInterests()
            }
            
        }
        
    }
    
    func addInterests(){
        for interest in interests{
            interestsList.addTag(interest.name, target: self, tapAction: Selector("interestTap:"), longPressAction: Selector("longPress"), backgroundColor: UIColor.clearColor(), textColor: UIColor.whiteColor(), interest: interest)
        }
    }
    
    func interestTap(sender:UITapGestureRecognizer){
        
        let interestLabel = sender.view as! InterestLabel
        
        if interestLabel.selected {
            
            for var i = 0; i < interests.count; i++ {
                if interestLabel.text == interests[i].name {
                    self.interests.removeAtIndex(i)
                    interestLabel.setUnselected()
                }
               
            }
            
            
        }else{
            self.selectedInterests.append(interestLabel.interest)
            interestLabel.setSelected()
        }
        
        
    }
    
    @IBAction func createAccount(){
    
        if self.validateForm() {
            let newUser = User()
            newUser.email = self.verifiedEmail
            newUser.username = self.username.text
            newUser.password = self.password.text
            newUser.interests = self.selectedInterests
            if let profileImage = selectedImage {
                let imageData = NSData(data:UIImagePNGRepresentation(profileImage)!)
                newUser.profilePicture = PFFile(data: imageData)!
            }
            
            newUser.signUpInBackgroundWithBlock({ (success, error ) -> Void in
                if error == nil && success {
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    let viewController = appDelegate.window?.rootViewController as! UINavigationController
                    
                    let tabBar = MainTabBarViewController()
                    viewController.pushViewController(tabBar, animated: true)
                }
                
            })
        }
        
    }
    
    func validateForm() -> Bool {
        if username.text == "" || password.text == "" {
            self.showWarning("Uh Oh!", warningMessage: "Username and password are required")
            return false
        }
        
        return true
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
