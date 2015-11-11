//
//  JoinStep2ViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/8/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit
import Parse

class JoinStep2ViewController: GradusViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // IBOutlets
    @IBOutlet var addImageButton:UIButton!
    @IBOutlet var username:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var usernameErrorLabel:UILabel!
    @IBOutlet var interestsCollection:UICollectionView!
    
    // properties
    var interests:[Interest] = [Interest]()
    var verifiedEmail:String!
    var imagePickerController:UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addImageButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        username.addTarget(self, action: Selector("checkUsername"), forControlEvents: UIControlEvents.EditingChanged)
        
        
        getInterestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                self.interestsCollection.reloadData()
                
            }
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let currentInterest = self.interests[indexPath.row]
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("interestCell", forIndexPath: indexPath) as! InterestCollectionViewCell
        
        
        cell.interestLabel.text = currentInterest.name
        cell.deselect()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
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
