//
//  PostViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    var attemptedPost = false
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //Idea Criteria Buttons
    @IBOutlet weak var jobTypeButton1: UIButton!
    @IBOutlet weak var jobTypeButton2: UIButton!
    @IBOutlet weak var jobTypeButton3: UIButton!
    
    //Idea words that describe each idea.
    @IBOutlet weak var criteriaButton1: UIButton!
    @IBOutlet weak var criteriaButton2: UIButton!
    @IBOutlet weak var criteriaButton3: UIButton!
    @IBOutlet weak var criteriaButton4: UIButton!
    @IBOutlet weak var criteriaButton5: UIButton!
    @IBOutlet weak var criteriaButton6: UIButton!
    @IBOutlet weak var criteriaButton7: UIButton!
    @IBOutlet weak var criteriaButton8: UIButton!
    @IBOutlet weak var criteriaButton9: UIButton!
    
    
    @IBOutlet weak var priceButton1: UIButton!
    @IBOutlet weak var priceButton2: UIButton!
    @IBOutlet weak var priceButton3: UIButton!
    @IBOutlet weak var priceButton4: UIButton!
    
    
    //Post button outlet
    @IBOutlet weak var postButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
updateUI()
        
        self.hideKeyboardWhenTappedAround()
//        descriptionTextView.delegate = self
        
        
    }
    
    
    @IBAction func jobTypeButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func criteriaButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
        
        
        
    }
    
    fileprivate func updateUI() {
        
        // Title Text Field
        titleTextField.layer.cornerRadius = 21.0
        titleTextField.layer.borderWidth = 1.0
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        titleTextField.setLeftPaddingPoints(15)
        
        // Description Text View
        descriptionTextView.layer.cornerRadius = 18.0
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 5)
        
        // Buttons
        jobTypeButton1.layer.cornerRadius = 18.0
        jobTypeButton1.layer.borderWidth = 1.0
        jobTypeButton1.layer.borderColor = UIColor.lightGray.cgColor
        jobTypeButton1.titleLabel?.adjustsFontSizeToFitWidth = true
        
        jobTypeButton2.layer.cornerRadius = 18.0
        jobTypeButton2.layer.borderWidth = 1.0
        jobTypeButton2.layer.borderColor = UIColor.lightGray.cgColor
        jobTypeButton2.titleLabel?.adjustsFontSizeToFitWidth = true
        
        jobTypeButton3.layer.cornerRadius = 18.0
        jobTypeButton3.layer.borderWidth = 1.0
        jobTypeButton3.layer.borderColor = UIColor.lightGray.cgColor
        jobTypeButton3.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton1.layer.cornerRadius = 18.0
        criteriaButton1.layer.borderWidth = 1.0
        criteriaButton1.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton1.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton2.layer.cornerRadius = 18.0
        criteriaButton2.layer.borderWidth = 1.0
        criteriaButton2.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton2.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton3.layer.cornerRadius = 18.0
        criteriaButton3.layer.borderWidth = 1.0
        criteriaButton3.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton3.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton4.layer.cornerRadius = 18.0
        criteriaButton4.layer.borderWidth = 1.0
        criteriaButton4.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton4.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton5.layer.cornerRadius = 18.0
        criteriaButton5.layer.borderWidth = 1.0
        criteriaButton5.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton5.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton6.layer.cornerRadius = 18.0
        criteriaButton6.layer.borderWidth = 1.0
        criteriaButton6.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton6.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
        criteriaButton7.layer.cornerRadius = 18.0
        criteriaButton7.layer.borderWidth = 1.0
        criteriaButton7.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton7.titleLabel?.adjustsFontSizeToFitWidth = true

        
        criteriaButton8.layer.cornerRadius = 18.0
        criteriaButton8.layer.borderWidth = 1.0
        criteriaButton8.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton8.titleLabel?.adjustsFontSizeToFitWidth = true

        
        criteriaButton9.layer.cornerRadius = 18.0
        criteriaButton9.layer.borderWidth = 1.0
        criteriaButton9.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton9.titleLabel?.adjustsFontSizeToFitWidth = true

        
        priceButton1.layer.cornerRadius = 18.0
        priceButton1.layer.borderWidth = 1.0
        priceButton1.layer.borderColor = UIColor.lightGray.cgColor
        priceButton1.titleLabel?.adjustsFontSizeToFitWidth = true

        
        priceButton2.layer.cornerRadius = 18.0
        priceButton2.layer.borderWidth = 1.0
        priceButton2.layer.borderColor = UIColor.lightGray.cgColor
        priceButton2.titleLabel?.adjustsFontSizeToFitWidth = true

        
        priceButton3.layer.cornerRadius = 18.0
        priceButton3.layer.borderWidth = 1.0
        priceButton3.layer.borderColor = UIColor.lightGray.cgColor
        priceButton3.titleLabel?.adjustsFontSizeToFitWidth = true

        
        priceButton4.layer.cornerRadius = 18.0
        priceButton4.layer.borderWidth = 1.0
        priceButton4.layer.borderColor = UIColor.lightGray.cgColor
        priceButton4.titleLabel?.adjustsFontSizeToFitWidth = true

        
        
        // Post Button
        postButton.layer.cornerRadius = 24.0
        postButton.layer.borderWidth = 1.0
        postButton.layer.borderColor = UIColor.lightGray.cgColor
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

