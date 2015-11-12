//
//  JoinStep1ViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/8/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class JoinStep1ViewController: GradusViewController {
    
    // outlets
    @IBOutlet var emailTextField:UITextField!
    @IBOutlet var nextButton:UIButton!
    
    var viewModel:JoinStep1ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = JoinStep1ViewModel()
        
        // add textfield changed listener
        self.emailTextField.addTarget(self, action: Selector("textFieldDidChange"), forControlEvents: UIControlEvents.EditingChanged)
        
        self.nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.nextButton.layer.borderWidth = 2
        self.nextButton.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.createPurpleGradient()
    }
    
    func textFieldDidChange(){
        if Validation().validateEmail(emailTextField.text!){
            nextButton.enabled = true
        }else{
            nextButton.enabled = false
        }
    }
    
    @IBAction func goToNextScreen(sender:UIButton){
        
        
        viewModel.checkIfEmailExists(emailTextField.text!) { (exists, error ) -> Void in
            
            if error != nil {
                self.showWarning("Uh oh! Something went wrong!", warningMessage: "Please try again by hitting the next button")
            } else {
                if exists! {
                    self.showWarning("Email alrady exists", warningMessage: "The email you are trying to use is already registered. Please try to login or use a different email.")
                } else{
                    self.performSegueWithIdentifier("goToStep2", sender: self)
                }
                
                
            }
            
            
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let step2ViewController = segue.destinationViewController as! JoinStep2ViewController
        step2ViewController.verifiedEmail = self.emailTextField.text!
        
    }

}
