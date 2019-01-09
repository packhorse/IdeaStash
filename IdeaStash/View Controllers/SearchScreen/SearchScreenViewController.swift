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
    var selectedIdeaPriceButton: UIButton?
    
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
    @IBOutlet weak var criteriaButton10: UIButton!
    @IBOutlet weak var criteriaButton11: UIButton!
    @IBOutlet weak var criteriaButton12: UIButton!
    @IBOutlet weak var criteriaButton13: UIButton!
    @IBOutlet weak var criteriaButton14: UIButton!
    @IBOutlet weak var criteriaButton15: UIButton!
    
    @IBOutlet weak var criteriaButton16: UIButton!
    @IBOutlet weak var criteriaButton17: UIButton!
    @IBOutlet weak var criteriaButton18: UIButton!
    @IBOutlet weak var criteriaButton19: UIButton!
    @IBOutlet weak var criteriaButton20: UIButton!
    @IBOutlet weak var criteriaButton21: UIButton!
    @IBOutlet weak var criteriaButton22: UIButton!
    @IBOutlet weak var criteriaButton23: UIButton!
    @IBOutlet weak var criteriaButton24: UIButton!
    

    
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
            
        case "aloneSearch":
            ideaType = IdeaType.Alone
            vcThemeColor = UIColor(named: Constants.coolBlue)
        case "familySearch":
            ideaType = IdeaType.Family
            vcThemeColor = UIColor(named: Constants.coolOrange)
        case "friendsOrDateSearch":
            ideaType = IdeaType.FriendsOrDate
            vcThemeColor = UIColor(named: Constants.rudeRed)
        default:
            print("Something went wrong when searching // Idea Type")
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
        case "outdoors" :
            ideaCriteria = IdeaCriteria.thrilling
        case "indoors" :
            ideaCriteria = IdeaCriteria.food
        case "exercise" :
            ideaCriteria = IdeaCriteria.indoors
        case "active" :
            ideaCriteria = IdeaCriteria.outdoors
        case "romantic" :
            ideaCriteria = IdeaCriteria.different
        case "competitive" :
            ideaCriteria = IdeaCriteria.scary
        case "exhilarating" :
            ideaCriteria = IdeaCriteria.secret
        case "scary" :
            ideaCriteria = IdeaCriteria.romantic
        case "thrilling" :
            ideaCriteria = IdeaCriteria.thrilling
        case "social" :
            ideaCriteria = IdeaCriteria.social
        case "food" :
            ideaCriteria = IdeaCriteria.food
        case "fun" :
            ideaCriteria = IdeaCriteria.fun
        case "funny" :
            ideaCriteria = IdeaCriteria.funny
        case "secret" :
            ideaCriteria = IdeaCriteria.secret
        case "learning" :
            ideaCriteria = IdeaCriteria.learning
        case "creative" :
            ideaCriteria = IdeaCriteria.creative
        case "cleaning" :
            ideaCriteria = IdeaCriteria.cleaning
        case "task" :
            ideaCriteria = IdeaCriteria.task
        case "lazy" :
            ideaCriteria = IdeaCriteria.lazy
        case "satisfying" :
            ideaCriteria = IdeaCriteria.satisfying
        case "relaxing" :
            ideaCriteria = IdeaCriteria.relaxing
        case "quiet" :
            ideaCriteria = IdeaCriteria.quiet
        case "different" :
            ideaCriteria = IdeaCriteria.different
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
            
        case "FreeSearch" :
            ideaPrice = IdeaPrice.free
        case "CheapSearch" :
            ideaPrice = IdeaPrice.cheap
        case "AverageSearch" :
            ideaPrice = IdeaPrice.average
        case "AnySearch" :
            ideaPrice = IdeaPrice.any
        default:
            print("There was an issue with the price criteria")
            
        }
        
        if ideaPrice != IdeaController.shared.ideaPriceFilter {
            
            
            turnOnButtonColor(sender)
            
            turnOffButtonColor(selectedIdeaPriceButton)
            selectedIdeaPriceButton = sender
            IdeaController.shared.ideaPriceFilter = ideaPrice
            
        } else {
            
            IdeaController.shared.ideaPriceFilter = nil
            selectedIdeaPriceButton = nil
            
            turnOffButtonColor(sender)
            turnOffColorTheme()
            
            
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
        
        guard let selectedPriceButton = selectedIdeaPriceButton else { return }
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
            case .Alone :
                vcThemeColor = UIColor(named: Constants.coolBlue)
                selectedButton = ideaTypeButton1
            case .Family :
                vcThemeColor = UIColor(named: Constants.coolOrange)
                selectedButton = ideaTypeButton2
            case .FriendsOrDate :
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
            case .outdoors:
                selectedCriteriaButtons.append(criteriaButton2)
            case .indoors:
                selectedCriteriaButtons.append(criteriaButton3)
            case .exercise:
                selectedCriteriaButtons.append(criteriaButton4)
            case .active:
                selectedCriteriaButtons.append(criteriaButton5)
            case .romantic:
                selectedCriteriaButtons.append(criteriaButton6)
            case .competitive:
                selectedCriteriaButtons.append(criteriaButton7)
            case .exhilarating:
                selectedCriteriaButtons.append(criteriaButton8)
            case .scary:
                selectedCriteriaButtons.append(criteriaButton9)
            case .thrilling:
                selectedCriteriaButtons.append(criteriaButton10)
            case .social:
                selectedCriteriaButtons.append(criteriaButton11)
            case .food:
                selectedCriteriaButtons.append(criteriaButton12)
            case .fun:
                selectedCriteriaButtons.append(criteriaButton13)
            case .funny:
                selectedCriteriaButtons.append(criteriaButton14)
            case .secret:
                selectedCriteriaButtons.append(criteriaButton15)
            case .learning:
                selectedCriteriaButtons.append(criteriaButton16)
            case .creative:
                selectedCriteriaButtons.append(criteriaButton17)
            case .cleaning:
                selectedCriteriaButtons.append(criteriaButton18)
            case .task:
                selectedCriteriaButtons.append(criteriaButton19)
            case .lazy:
                selectedCriteriaButtons.append(criteriaButton20)
            case .satisfying:
                selectedCriteriaButtons.append(criteriaButton21)
            case .relaxing:
                selectedCriteriaButtons.append(criteriaButton22)
            case .quiet:
                selectedCriteriaButtons.append(criteriaButton23)
            case .different:
                selectedCriteriaButtons.append(criteriaButton24)
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
            selectedIdeaPriceButton = selectedPriceButton
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
        setupUIFor(criteriaButton10)
        setupUIFor(criteriaButton11)
        setupUIFor(criteriaButton12)
        setupUIFor(criteriaButton13)
        setupUIFor(criteriaButton14)
        setupUIFor(criteriaButton15)
        setupUIFor(criteriaButton16)
        setupUIFor(criteriaButton17)
        setupUIFor(criteriaButton18)
        setupUIFor(criteriaButton19)
        setupUIFor(criteriaButton20)
        setupUIFor(criteriaButton21)
        setupUIFor(criteriaButton22)
        setupUIFor(criteriaButton23)
        setupUIFor(criteriaButton24)

        
        
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




