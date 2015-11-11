//
//  User.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/5/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit
import Parse

class User: PFUser {
    
    @NSManaged var interests:[Interest]
    @NSManaged var profilePicture:PFFile
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }

    
}
