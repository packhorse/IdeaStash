//
//  ListingDetailViewViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/19/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {
    
    var idea: Idea? {
        didSet {
            updateViews()
        }
    }
    
    var themeColor: UIColor? = UIColor.lightGray
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var posterIdeaTypeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ideaDescriptionLabel: UILabel!
    @IBOutlet weak var ideaCriteriaLabel: UILabel!
    @IBOutlet weak var userUsernameLabel: UILabel!
    @IBOutlet weak var reportListingButton: UIButton!
    @IBOutlet weak var thisIdeaHelpedMeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupButtons()
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func reportIdeaButtonTapped(_ sender: UIButton) {
        
        let alertVC = UIAlertController(title: "Are you sure?", message: "By clicking \"Report\", you are reporting this listing for review by our moderators and it may result in the idea being removed.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let report = UIAlertAction(title: "Report", style: .destructive) { (_) in
            
            IdeaController.shared.reportIdea(withIdeaID: self.idea!.listingID, completion: { (successful) in
                if successful {
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
        
        alertVC.addAction(cancel)
        alertVC.addAction(report)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    fileprivate func setupButtons() {
        
        guard let username = idea?.username else { return }
        
        UserController.shared.fetchUserProfile(withUsername: username) { (user) in
            guard let postingUser = user else { return }
        }
    }
    
    fileprivate func updateViews() {
        
        guard let idea = idea else { return }
        
        loadViewIfNeeded()
        posterIdeaTypeLabel.text = "\(idea.ideaType)"
        titleLabel.text = idea.title
        priceLabel.text = idea.ideaPrice.rawValue
        ideaDescriptionLabel.text = idea.description
        ideaCriteriaLabel.text = getCriteriaAsString()
        userUsernameLabel.text = "@\(idea.username)"
        
                setThemeColor()
    }
    
    fileprivate func setThemeColor() {
        
        guard let idea = idea else { return }
        
        switch idea.ideaType {
        case .Alone :
            themeColor = UIColor(named: Constants.coolBlue)
        case .Family :
            themeColor = UIColor(named: Constants.coolOrange)
        case .FriendsOrDate :
            themeColor = UIColor(named: Constants.rudeRed)
        }
        
        backgroundColorView.backgroundColor = themeColor
        reportListingButton.setTitleColor(themeColor, for: .normal)
        
    }
    
    
    
    fileprivate func getIdeaTypeAsString() -> String {
        
        guard let idea = idea else { return "" }
        
        switch idea.ideaType {
        case .Alone :
            return "Alone"
        case .Family :
            return "Family"
        case .FriendsOrDate :
            return "Friends/Date"
        }
    }
    
    
    fileprivate func getCriteriaAsString() -> String {
        
        guard let idea = idea else { return "" }
        
        var criteriaOrQualities = [String]()
        
        for criteria in idea.criteria {
            
            switch criteria {
            case .adventurous :
                criteriaOrQualities.append("Adventurous")
            case .food :
                criteriaOrQualities.append("Food")
            case .indoors :
                criteriaOrQualities.append("Indoors")
            case .outdoors :
                criteriaOrQualities.append("Outdoors")
            case .romantic :
                criteriaOrQualities.append("Romantic")
            case .scary :
                criteriaOrQualities.append("Scary")
            case .secret :
                criteriaOrQualities.append("Secret")
            case .thrilling :
                criteriaOrQualities.append("Thrillful")
            case .different :
                criteriaOrQualities.append("Unique")
            case .active :
                criteriaOrQualities.append("Active")
            case .cleaning :
                criteriaOrQualities.append("Cleaning")
            case .competitive :
                criteriaOrQualities.append("Competitive")
            case .creative :
                criteriaOrQualities.append("Creative")
            case .exercise :
                criteriaOrQualities.append("Exercise")
            case .exhilarating :
                criteriaOrQualities.append("Exhilarating")
            case .fun :
                criteriaOrQualities.append("Fun")
            case .funny :
                criteriaOrQualities.append("Funny")
            case .lazy :
                criteriaOrQualities.append("Lazy")
            case .learning :
                criteriaOrQualities.append("Learning")
            case .quiet :
                criteriaOrQualities.append("Quiet")
            case .relaxing :
                criteriaOrQualities.append("Relaxing")
            case .satisfying :
                criteriaOrQualities.append("Satisfying")
            case .social :
                criteriaOrQualities.append("Social")
            case .task :
                criteriaOrQualities.append("Task")
            }
        }
        return criteriaOrQualities.joined(separator: ", ")
    }
    
    
    fileprivate func getIdeaPricaAsString() -> String {
        
        guard let idea = idea else { return "" }
        
        
        switch idea.ideaPrice {
        case .free :
            return "Free"
        case .cheap :
            return "$"
        case .average :
            return "$$"
        case .any :
            return "Any"
            
        }
    }
}



extension Date {
    
    var asString: String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
