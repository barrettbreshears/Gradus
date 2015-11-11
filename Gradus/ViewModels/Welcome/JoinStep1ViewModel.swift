//
//  JoinStep1ViewModel.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/8/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit
import Parse

class JoinStep1ViewModel: GradusViewModel {
    
    func checkIfEmailExists(email:String, emailVerified:(Bool?, NSError?) -> Void){
        
        let query = PFQuery(className:"User");
        query.whereKey("email", equalTo: email)
        query.findObjectsInBackgroundWithBlock { (user, error) -> Void in
            
            if error != nil  {
                emailVerified(nil, error)
            }else{
                
                if user != nil {
                    emailVerified(false, nil)
                }else {
                    emailVerified(true, nil)
                }
            }
            
        }
        
    }

}
