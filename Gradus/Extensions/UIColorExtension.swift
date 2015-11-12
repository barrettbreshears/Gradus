//
//  UIColorExtension.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/9/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func gradusPurlple() -> UIColor{
        return UIColor.colorFromRGB(red: 73, green: 0, blue: 148)
    }
    
    static func lightPurpleGradient() -> UIColor{
        return UIColor.colorFromRGB(red: 156, green: 64, blue: 231)
    }
    
    static func darkPurpleGradient() -> UIColor{
        return UIColor.colorFromRGB(red: 83, green: 0, blue: 154)
    }
    
    public class func colorFromRGB(red red:UInt, green: UInt, blue:UInt) -> UIColor {
        return UIColor(red: (CGFloat(red)/255.0), green: (CGFloat(green)/255.0), blue: (CGFloat(blue)/255), alpha: 1)
    }
}