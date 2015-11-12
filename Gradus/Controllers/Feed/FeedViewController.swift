//
//  FeedViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/11/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class FeedViewController: GradusViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let addPostBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("createAlert"))
        self.navigationItem.rightBarButtonItem = addPostBtn
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createAlert(){
        let alert = UIAlertController(title: "Create a new moment", message: "Would you like to create a new Journey select from an existing Jouney", preferredStyle: UIAlertControllerStyle.Alert)
        
        let existingJourney = UIAlertAction(title: "Select Existing Journey", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        }
        alert.addAction(existingJourney)
        
        
        let createNewAction = UIAlertAction(title: "Create New Journey", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        }
        alert.addAction(createNewAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
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
