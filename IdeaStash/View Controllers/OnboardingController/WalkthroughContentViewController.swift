//
//  WalkthroughContentViewController.swift
//  Walkthrough
//
//  Created by Porter Frazier on 1/7/19.
//  Copyright © 2019 BULB. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subHeadingLabel: UILabel! {
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }

    @IBOutlet var contentImageView: UIImageView!
    
    @IBOutlet var contentViewView: UIView!
    
    
        var index = 0
        var heading = ""
        var subHeading = ""
        var imageFile = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: "" )
        
    }
}
