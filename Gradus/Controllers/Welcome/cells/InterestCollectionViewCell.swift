//
//  InterestCollectionViewCell.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/9/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var interestLabel:UILabel!
    
    func setSelected(){
        self.backgroundColor = UIColor.whiteColor()
        self.interestLabel.textColor = UIColor.gradusPurlple()
    }
    
    func deselect(){
        self.backgroundColor = UIColor.clearColor()
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1
    }
    
}
