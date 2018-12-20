//
//  ListingDetailViewViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/19/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var posterNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hourlyPayLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var smallHourlyPayLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var qualitiesLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var reportListingButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var textButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        
//        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func reportListingButtonTapped(_ sender: UIButton) {
        
//        let alertVC = UIAlertController(title: "Are you sure?", message: "By clicking \"Report\", you are reporting this listing for review by our moderators and it may result in the listing being removed.", preferredStyle: .alert)
//
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let report = UIAlertAction(title: "Report", style: .destructive) { (_) in
//
//            JobListingController.shared.reportJobListing(withListingID: self.jobListing!.listingID, completion: { (successful) in
//                if successful {
//                    self.dismiss(animated: true, completion: nil)
//                }
//            })
//        }
//
//        alertVC.addAction(cancel)
//        alertVC.addAction(report)
//
//        present(alertVC, animated: true, completion: nil)
    }



}
