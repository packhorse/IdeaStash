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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func jobTypeButtonTapped(_ sender: UIButton) {
        
//        var jobType: JobType?
//
//        switch sender.restorationIdentifier {
//        case "contracting":
//            jobType = JobType.generalContracting
//            vcThemeColor = UIColor(named: Constants.coolOrange)
//        case "electrical":
//            jobType = JobType.electrical
//            vcThemeColor = UIColor(named: Constants.coolBlue)
//        case "handyman":
//            jobType = JobType.handyman
//            vcThemeColor = UIColor(named: Constants.urineYellow)
//        case "interiorDesign":
//            jobType = JobType.interiorDesign
//            vcThemeColor = UIColor(named: Constants.rudeRed)
//        case "homeRenno":
//            jobType = JobType.homeRenovation
//            vcThemeColor = UIColor(named: Constants.popsiclePurple)
//        case "landscaping":
//            jobType = JobType.landscaping
//            vcThemeColor = UIColor(named: Constants.grassyGreen)
//        default:
//            print("Something went wrong!")
//        }
//
//        if jobType != selectedJobType {
//
//            // Updates the theme accross the entire view
//            turnOnButtonColor(sender)
//            updateVCThemeColor()
//
//            // Turn off the color on the previously selected button
//            turnOffButtonColor(selectedJobTypeButton)
//
//            // Make the sender/tapped button the new selected button
//            selectedJobTypeButton = sender
//            selectedJobType = jobType
//        }
    }
    
    
    @IBAction func criteriaButtonTapped(_ sender: UIButton) {
        
//        var criteria: JobCriteria?
//
//        switch sender.restorationIdentifier {
//        case "team":
//            criteria = JobCriteria.fullTeam
//        case "quality":
//            criteria = JobCriteria.highQuality
//        case "specalized":
//            criteria = JobCriteria.specialized
//        case "fast":
//            criteria = JobCriteria.fast
//        case "experienced":
//            criteria = JobCriteria.experienced
//        case "affordable":
//            criteria = JobCriteria.affordable
//
//        default:
//            print("something went wrong")
//        }
//
//        guard let unwrappedCriteria = criteria else { return }
//        if selectedCriterias.contains(unwrappedCriteria) {
//            let index = selectedCriterias.firstIndex(of: unwrappedCriteria)
//            selectedCriterias.remove(at: index!)
//            selectedCriteriaButtons.remove(at: index!)
//            turnOffButtonColor(sender)
//        } else {
//            // If three types are selected, remove the last one and replace it with the new selection
//            if selectedCriterias.count == 3 {
//                turnOffButtonColor(selectedCriteriaButtons[2])
//                selectedCriterias.remove(at: 2)
//                selectedCriteriaButtons.remove(at: 2)
//            }
//            selectedCriterias.append(unwrappedCriteria)
//            selectedCriteriaButtons.append(sender)
//            turnOnButtonColor(sender)
//        }
    }
    
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
//        
//        guard let title = titleTextField.text, !title.isEmpty,
//            let description = descriptionTextView.text, !description.isEmpty,
//            let jobType = selectedJobType,
//            selectedCriterias.count == 3
//            else { print("Missing info") ; return  }
//        
//        let hourlyPay = Int(paySlider.value)
//        let zipCode = "84041"
//        
//        if (UserController.shared.loggedInUser != nil) {
//            JobListingController.shared.postJobListing(withTitle: title, description: description, jobType: jobType,
//                                                       criteria: selectedCriterias, hourlyPay: hourlyPay,
//                                                       zipCode: zipCode) { (success) in
//                                                        if success {
//                                                            
//                                                            self.tabBarController?.selectedIndex = 2
//                                                            self.resetVC()
//                                                        } else {
//                                                            print("WompWompWompppp...")
//                                                        }
//            }
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let signUpVC = storyboard.instantiateViewController(withIdentifier: "signInVC") as! LogInViewController
//            signUpVC.themeColor = vcThemeColor
//            self.present(signUpVC, animated: true, completion: nil)
//            attemptedPost = true
//        }
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

