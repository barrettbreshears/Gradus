//
//  Validation.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/8/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

public class Validation: NSObject {
    
    public func validateEmail(email:String)->Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)

    }
    
}
