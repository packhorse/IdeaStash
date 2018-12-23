//
//  SearchScreenViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class SearchScreenViewController: UIViewController {
    
    var selectedIdeaTypeButton: UIButton?
    var selectedCriteriaButtons: [UIButton] = []
    var selectedPriceButton: UIButton?
    var vcThemeColor: UIColor? = UIColor.lightGray
    
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
        
        updateUI()
    }
    
    @IBAction func applyFiltersButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func ideaTypeButtonSelected(_ sender: UIButton) {
        
        var ideaType: IdeaType?
        
        switch sender.restorationIdentifier {
            
        case "alone":
            ideaType = IdeaType.alone
            vcThemeColor = UIColor(named: Constants.coolBlue)
        case "family":
            ideaType = IdeaType.family
            vcThemeColor = UIColor(named: Constants.coolOrange)
        case "friendsOrDate":
            ideaType = IdeaType.friendsOrDate
            vcThemeColor = UIColor(named: Constants.rudeRed)
        default:
            print("Something went wrong when searching")
        }
        
        if ideaType != IdeaController.shared.ideaTypeFilter {
            
            turnOnButtonColor(sender)
            updateVCThemeColor()
            
            turnOffButtonColor(selectedIdeaTypeButton)
            
            selectedIdeaTypeButton = sender
            IdeaController.shared.ideaTypeFilter = ideaType
        } else {
            
            IdeaController.shared.ideaTypeFilter = nil
            
            selectedIdeaTypeButton = nil
            turnOffButtonColor(sender)
            turnOffColorTheme()
        }
        
    }
    
    
    @IBAction func criteriaButtonTapped(_ sender: UIButton) {
        
        var ideaCriteria: IdeaCriteria?
        
        switch sender.restorationIdentifier {
        case "adventurous":
            ideaCriteria = IdeaCriteria.adventurous
        case "thrillful" :
            ideaCriteria = IdeaCriteria.thrillful
        case "hungry" :
            ideaCriteria = IdeaCriteria.hungry
        case "indoors" :
            ideaCriteria = IdeaCriteria.indoors
        case "outdoors" :
            ideaCriteria = IdeaCriteria.outdoors
        case "unique" :
            ideaCriteria = IdeaCriteria.unique
        case "scary" :
            ideaCriteria = IdeaCriteria.scary
        case "secret" :
            ideaCriteria = IdeaCriteria.secret
        case "romantic" :
            ideaCriteria = IdeaCriteria.romantic
        default: print("something went wront with sorting through your idea criteria")
            
        }
        
        guard let unwrappedCriteria = ideaCriteria else { return }
        
        if IdeaController.shared.ideaCriteriaFilters.contains(unwrappedCriteria) {
            let index = IdeaController.shared.ideaCriteriaFilters.firstIndex(of: unwrappedCriteria)
            IdeaController.shared.ideaCriteriaFilters.remove(at: index!)
            selectedCriteriaButtons.remove(at: index!)
                        turnOffButtonColor(sender)
        } else {
            if IdeaController.shared.ideaCriteriaFilters.count == 3 {
                                turnOffButtonColor(selectedCriteriaButtons[2])
                IdeaController.shared.ideaCriteriaFilters.remove(at: 2)
                selectedCriteriaButtons.remove(at: 2)
            }
            IdeaController.shared.ideaCriteriaFilters.append(unwrappedCriteria)
            selectedCriteriaButtons.append(sender)
                        turnOnButtonColor(sender)
        }
    }
    
    
    @IBAction func priceButtonTapped(_ sender: UIButton) {
        
        
        var ideaPrice: IdeaPrice?
        
        switch sender.restorationIdentifier {
            
        case "Free" :
            ideaPrice = IdeaPrice.free
        case "$" :
            ideaPrice = IdeaPrice.cheap
        case "$$" :
            ideaPrice = IdeaPrice.average
        case "Any" :
            ideaPrice = IdeaPrice.any
        default:
            print("There was an issue with the price criteria")
            
        }
        
        if ideaPrice != IdeaController.shared.ideaPriceFilter {
            
            turnOnButtonColor(sender)
            turnOffButtonColor(selectedPriceButton)
            selectedPriceButton = sender
            IdeaController.shared.ideaPriceFilter = ideaPrice
            
        } else {
            
            turnOffButtonColor(sender)
            IdeaController.shared.ideaPriceFilter = nil
            
            selectedPriceButton = nil
            
        }
    }
    
    
    fileprivate func turnOnButtonColor(_ sender: UIButton) {
        
        // Updates the view for the button tapped by the User
        sender.backgroundColor = vcThemeColor
        sender.layer.shadowColor = vcThemeColor?.cgColor
        sender.layer.shadowRadius = 4
        sender.layer.shadowOpacity = 1
        sender.layer.shadowOffset = CGSize(width: 0, height: 0)
        sender.layer.borderColor = vcThemeColor?.cgColor
        sender.setTitleColor(UIColor.white, for: .normal)
    }
    
    fileprivate func turnOffButtonColor(_ button: UIButton?) {
        
        guard let button = button else { return }
        // Restores the view for the button to its default
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        if button != selectedIdeaTypeButton {
            
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    fileprivate func turnOffColorTheme() {
        
        vcThemeColor = UIColor.lightGray
        
        _ = selectedCriteriaButtons.map({ turnOnButtonColor($0) })
        applyFiltersButton.backgroundColor = vcThemeColor
        applyFiltersButton.layer.shadowColor = vcThemeColor?.cgColor
        applyFiltersButton.layer.borderColor = vcThemeColor?.cgColor
        applyFiltersButton.layer.shadowOpacity = 2.0
        applyFiltersButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    
    fileprivate func updateVCThemeColor() {
        
        _ = selectedCriteriaButtons.map({ turnOnButtonColor($0) })
        applyFiltersButton.backgroundColor = vcThemeColor
        applyFiltersButton.layer.shadowColor = vcThemeColor?.cgColor
        applyFiltersButton.layer.borderColor = vcThemeColor?.cgColor
        applyFiltersButton.layer.shadowOpacity = 2.0
        applyFiltersButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        applyFiltersButton.setTitleColor(UIColor.white, for: .normal)
        
        guard let selectedPriceButton = selectedPriceButton else { return }
        turnOnButtonColor(selectedPriceButton)
    }
    
    func setupUIFor(_ button: UIButton) {
        
        button.layer.cornerRadius = 18.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    fileprivate func turnOnExistingIdeaTypeFilterButton() {
        
        if let ideaType = IdeaController.shared.ideaTypeFilter {
            
            var selectedButton: UIButton? = nil
            
            switch ideaType {
            case .alone :
                vcThemeColor = UIColor(named: Constants.coolBlue)
                selectedButton = ideaTypeButton1
            case .family :
                vcThemeColor = UIColor(named: Constants.coolOrange)
                selectedButton = ideaTypeButton2
            case .friendsOrDate :
                vcThemeColor = UIColor(named: Constants.rudeRed)
                selectedButton = ideaTypeButton3
            }
            
            selectedIdeaTypeButton = selectedButton
            turnOnButtonColor(selectedButton!)
            updateVCThemeColor()
        }
    }
    
    
    fileprivate func turnOnExistingCriteriaButtons() {
        
        for criteria in IdeaController.shared.ideaCriteriaFilters {
            
            switch criteria {
            case .adventurous:
                selectedCriteriaButtons.append(criteriaButton1)
            case .thrillful:
                selectedCriteriaButtons.append(criteriaButton2)
            case .hungry:
                selectedCriteriaButtons.append(criteriaButton3)
            case .indoors:
                selectedCriteriaButtons.append(criteriaButton4)
            case .outdoors:
                selectedCriteriaButtons.append(criteriaButton5)
            case .unique:
                selectedCriteriaButtons.append(criteriaButton6)
            case .scary:
                selectedCriteriaButtons.append(criteriaButton7)
            case .secret:
                selectedCriteriaButtons.append(criteriaButton8)
            case .romantic:
                selectedCriteriaButtons.append(criteriaButton9)
            }
        }
        
        for button in selectedCriteriaButtons {
            
            turnOnButtonColor(button)
        }
    }
    
    fileprivate func turnOnExistingPriceButton() {
        
        if let price = IdeaController.shared.ideaPriceFilter {
            var selectedPriceButton: UIButton? = nil
            
            switch price {
            case .free :
                selectedPriceButton = priceRangeButton1
            case .cheap :
                selectedPriceButton = priceRangeButton2
            case .average :
                selectedPriceButton = priceRangeButton3
            case .any :
                selectedPriceButton = priceRangeButton4
                
            }
            
            turnOnButtonColor(selectedPriceButton!)
         
            
            
        }
    }
    
    
    
    func updateUI() {
        
        
        // Setup Toggle Buttons
        setupUIFor(ideaTypeButton1)
        setupUIFor(ideaTypeButton2)
        setupUIFor(ideaTypeButton3)

        
        setupUIFor(criteriaButton1)
        setupUIFor(criteriaButton2)
        setupUIFor(criteriaButton3)
        setupUIFor(criteriaButton4)
        setupUIFor(criteriaButton5)
        setupUIFor(criteriaButton6)
        setupUIFor(criteriaButton7)
        setupUIFor(criteriaButton8)
        setupUIFor(criteriaButton9)
        
        
        setupUIFor(priceRangeButton1)
        setupUIFor(priceRangeButton2)
        setupUIFor(priceRangeButton3)
        setupUIFor(priceRangeButton4)
        
        // Setup Apply Filters Button
        applyFiltersButton.layer.cornerRadius = 21.0
        applyFiltersButton.layer.borderWidth = 1.0
        applyFiltersButton.layer.borderColor = UIColor.lightGray.cgColor
        

        // Setup previously selected filter buttons in session, if any
        turnOnExistingIdeaTypeFilterButton()
        turnOnExistingCriteriaButtons()
        turnOnExistingPriceButton()
    }
    
}




