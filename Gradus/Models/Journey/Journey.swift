//
//  Journey.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/11/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit
import Parse

class Journey: PFObject, PFSubclassing {

    @NSManaged var image:PFFile
    @NSManaged var title:String
    @NSManaged var desc:String
    @NSManaged var tags:[Interest]
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Journey"
    }

    
}
