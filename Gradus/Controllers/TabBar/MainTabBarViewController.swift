//
//  MainTabBarViewController.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/11/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let feedStoryboard = UIStoryboard(name: "FeedStoryboard", bundle: nil)
        let feedNavigationController = feedStoryboard.instantiateViewControllerWithIdentifier("FeedNavigatonController")
        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)
        self.viewControllers = [feedNavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
