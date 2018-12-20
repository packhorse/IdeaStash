//
//  SearchScreenViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class SearchScreenViewController: UIViewController {
    
    
    //Button idea types
    @IBOutlet weak var ideaTypeButton1: UIButton!
    @IBOutlet weak var ideaTypeButton2: UIButton!
    @IBOutlet weak var ideaTypeButton3: UIButton!
    
    //Button Criterias
    @IBOutlet weak var criteriaButton1: UIButton!
    @IBOutlet weak var criteriaButton2: UIButton!
    @IBOutlet weak var criteriaButton3: UIButton!
    @IBOutlet weak var criteriaButton4: UIButton!
    @IBOutlet weak var criteriaButton5: UIButton!
    @IBOutlet weak var criteriaButton6: UIButton!
    @IBOutlet weak var criteriaButton7: UIButton!
    @IBOutlet weak var criteriaButton8: UIButton!
    @IBOutlet weak var criteriaButton9: UIButton!
    
    //Buttons for price range
    @IBOutlet weak var priceRangeButton1: UIButton!
    @IBOutlet weak var priceRangeButton2: UIButton!
    @IBOutlet weak var priceRangeButton3: UIButton!
    @IBOutlet weak var priceRangeButton4: UIButton!
    
    
    
    
    @IBOutlet weak var applyFiltersButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func applyFiltersButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func jobTypeButtonSelected(_ sender: UIButton) {
        
        //        var jobType: JobType?
        //
        //        switch sender.restorationIdentifier {
        //
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
        //            print("Something went wrong when searching")
        //        }
        //
        //        if jobType != JobListingController.shared.jobTypeFilter {
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
        //            JobListingController.shared.jobTypeFilter = jobType
        //        } else {
        //
        //            // Update model controller filters
        //            JobListingController.shared.jobTypeFilter = nil
        //
        //            selectedJobTypeButton = nil
        //            turnOffButtonColor(sender)
        //            turnOffColorTheme()
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
//        default:
//            print("something went wrong")
//        }
//        
//        guard let unwrappedCriteria = criteria else { return }
//        
//        if JobListingController.shared.jobCriteriaFilters.contains(unwrappedCriteria) {
//            let index = JobListingController.shared.jobCriteriaFilters.firstIndex(of: unwrappedCriteria)
//            JobListingController.shared.jobCriteriaFilters.remove(at: index!)
//            selectedCriteriaButtons.remove(at: index!)
//            turnOffButtonColor(sender)
//        } else {
//            if JobListingController.shared.jobCriteriaFilters.count == 3 {
//                turnOffButtonColor(selectedCriteriaButtons[2])
//                JobListingController.shared.jobCriteriaFilters.remove(at: 2)
//                selectedCriteriaButtons.remove(at: 2)
//            }
//            JobListingController.shared.jobCriteriaFilters.append(unwrappedCriteria)
//            selectedCriteriaButtons.append(sender)
//            turnOnButtonColor(sender)
//        }
    }
}




