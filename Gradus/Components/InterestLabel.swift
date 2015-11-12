//
//  InterestLabel.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/11/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class InterestLabel: UILabel {

    var selected = false
    var interest:Interest!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func setSelected(){
        self.selected = true
        self.backgroundColor = UIColor.whiteColor()
        self.textColor = UIColor.purpleColor()
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.layer.borderWidth = 0
    }
    
    func setUnselected(){
        self.selected = false
        self.backgroundColor = UIColor.clearColor()
        self.textColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1
    }

}
