//
//  GradusViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 10/30/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class GradusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showWarning(warningTitle:String, warningMessage:String){
        
        let alert = UIAlertController(title: warningTitle, message: warningMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(alertAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func createPurpleGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.darkPurpleGradient().CGColor, UIColor.lightPurpleGradient().CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)

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
