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
    
    //These are the varialbes that change based on the4 selection=by the user.
    var selectedIdeaType: IdeaType?
    var selectedIdeaTypeButton: UIButton?
    
    var selectedIdeaPrice: IdeaPrice?
    var selectedIdeaPriceButton: UIButton?
    
    
    
    //    var selectedLocalOrUniversal: LocalOrUniversal?
    
    var vcThemeColor: UIColor? = UIColor.lightGray
    
    var selectedIdeaCriterias: [IdeaCriteria] = []
    var selectedIdeaCriteriaButton: [UIButton] = []
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //Idea Criteria Buttons
    @IBOutlet weak var ideaTypeButton1: UIButton!
    @IBOutlet weak var ideaTypeButton2: UIButton!
    @IBOutlet weak var ideaTypeButton3: UIButton!
    
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
        
        titleTextField.delegate = self
        descriptionTextView.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIWindow.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        
        
    }
    
    
    @IBAction func ideaTypeButtonTapped(_ sender: UIButton) {
        
        var ideaType: IdeaType?
        
        switch sender.restorationIdentifier {
            
        case "alonePost":
            ideaType = IdeaType.Alone
            vcThemeColor = UIColor(named: Constants.coolBlue)
        case "familyPost":
            ideaType = IdeaType.Family
            vcThemeColor = UIColor(named: Constants.coolOrange)
        case "friendsOrDatePost":
            ideaType = IdeaType.FriendsOrDate
            vcThemeColor = UIColor(named: Constants.rudeRed)
        default:
            print("Something went wrong when posting")
        }
        
        if ideaType != selectedIdeaType {
            
            turnOnButtonColor(sender)
            updateVCThemeColor()
            
            turnOffButtonColor(selectedIdeaTypeButton)
            
            selectedIdeaTypeButton = sender
            selectedIdeaType = ideaType
        }
        
    }
    
    
    @IBAction func criteriaButtonTapped(_ sender: UIButton) {
        
        var ideaCriteria: IdeaCriteria?
        
        switch sender.restorationIdentifier {
        case "Adventurous":
            ideaCriteria = IdeaCriteria.adventurous
        case "Outdoors" :
            ideaCriteria = IdeaCriteria.outdoors
        case "Indoors" :
            ideaCriteria = IdeaCriteria.indoors
        case "Exercise" :
            ideaCriteria = IdeaCriteria.exercise
        case "Active" :
            ideaCriteria = IdeaCriteria.active
        case "Romantic" :
            ideaCriteria = IdeaCriteria.romantic
        case "Competitive" :
            ideaCriteria = IdeaCriteria.competitive
        case "Exhilarating" :
            ideaCriteria = IdeaCriteria.exhilarating
        case "Scary" :
            ideaCriteria = IdeaCriteria.scary
        case "Thrilling" :
            ideaCriteria = IdeaCriteria.thrilling
        case "Social" :
            ideaCriteria = IdeaCriteria.social
        case "Food" :
            ideaCriteria = IdeaCriteria.food
        case "Fun" :
            ideaCriteria = IdeaCriteria.fun
        case "Funny" :
            ideaCriteria = IdeaCriteria.funny
        case "Secret" :
            ideaCriteria = IdeaCriteria.secret
        case "Learning" :
            ideaCriteria = IdeaCriteria.learning
        case "Creative" :
            ideaCriteria = IdeaCriteria.creative
        case "Cleaning" :
            ideaCriteria = IdeaCriteria.cleaning
        case "Task" :
            ideaCriteria = IdeaCriteria.task
        case "Lazy" :
            ideaCriteria = IdeaCriteria.lazy
        case "Satisfying" :
            ideaCriteria = IdeaCriteria.satisfying
        case "Relaxing" :
            ideaCriteria = IdeaCriteria.relaxing
        case "Quiet" :
            ideaCriteria = IdeaCriteria.quiet
        case "Different" :
            ideaCriteria = IdeaCriteria.different
        default: print("something went wront with sorting through your idea criteria")
            
        }
        
        guard let unwrappedCriteria = ideaCriteria else { return }
        if selectedIdeaCriterias.contains(unwrappedCriteria) {
            let index = selectedIdeaCriterias.firstIndex(of: unwrappedCriteria)
            selectedIdeaCriterias.remove(at: index!)
            selectedIdeaCriteriaButton.remove(at: index!)
            turnOffButtonColor(sender)
        } else {
            
            if selectedIdeaCriterias.count == 3 {
                turnOffButtonColor(selectedIdeaCriteriaButton[2])
                selectedIdeaCriterias.remove(at: 2)
                selectedIdeaCriteriaButton.remove(at: 2)
            }
            selectedIdeaCriterias.append(unwrappedCriteria)
            selectedIdeaCriteriaButton.append(sender)
            turnOnButtonColor(sender)
        }
        
    }
    
    
    @IBAction func priceButtonTapped(_ sender: UIButton) {
        
        var ideaPrice: IdeaPrice?
        
        switch sender.restorationIdentifier {
            
        case "freePost" :
            ideaPrice = IdeaPrice.free
        case "cheapPost" :
            ideaPrice = IdeaPrice.cheap
        case "averagePost" :
            ideaPrice = IdeaPrice.average
        case "anyPost" :
            ideaPrice = IdeaPrice.any
        default:
            print("There was an issue with the price criteria")
            
        }
        
        self.selectedIdeaPrice = ideaPrice
        
        if ideaPrice != IdeaController.shared.ideaPriceFilter {
            
            turnOnButtonColor(sender)
            turnOffButtonColor(selectedIdeaPriceButton)
            selectedIdeaPriceButton = sender
            IdeaController.shared.ideaPriceFilter = ideaPrice
            
        } else {
            
            turnOffButtonColor(sender)
            IdeaController.shared.ideaPriceFilter = nil
            
            selectedIdeaPriceButton = nil
            
        }
    }
    
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
        guard let title = titleTextField.text, !title.isEmpty,
        let description = descriptionTextView.text, !description.isEmpty,
        let ideaType = selectedIdeaType,
        let ideaPrice = selectedIdeaPrice,
//        let ideaLocalOrUniversal = selectedLocalOrUniversal,
            selectedIdeaCriterias.count == 3
            else { print("Missing Info") ;return }
        
        let zipCode = "84604"
        
        
        if (UserController.shared.loggedInUser != nil) {
            IdeaController.shared.postIdea(with: title, description: description, ideaType: ideaType, criteria: selectedIdeaCriterias, price: ideaPrice, zipCode: zipCode/*localOrUniversal: ideaLocalOrUniversal*/) { (success) in
                
                if success {
                    
                    self.tabBarController?.selectedIndex = 2
                    self.resetVC()
                } else {
                    print("There was an issue with posting an idea")
                }
            }
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signUpVC = storyboard.instantiateViewController(withIdentifier: "signInVC") as! LogInViewController; signUpVC.themeColor = vcThemeColor
            self.present(signUpVC, animated: true, completion: nil)
            attemptedPost = true
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
    
    fileprivate func updateVCThemeColor() {
        
        _ = selectedIdeaCriteriaButton.map({ turnOnButtonColor($0) })
        _ = selectedIdeaPriceButton.map({ turnOnButtonColor($0) })
        postButton.backgroundColor = vcThemeColor
        postButton.layer.shadowColor = vcThemeColor?.cgColor
        postButton.layer.borderColor = vcThemeColor?.cgColor
        postButton.layer.shadowOpacity = 2.0
        postButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        postButton.setTitleColor(UIColor.white, for: .normal)
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
        ideaTypeButton1.layer.cornerRadius = 18.0
        ideaTypeButton1.layer.borderWidth = 1.0
        ideaTypeButton1.layer.borderColor = UIColor.lightGray.cgColor
        ideaTypeButton1.titleLabel?.adjustsFontSizeToFitWidth = true
        
        ideaTypeButton2.layer.cornerRadius = 18.0
        ideaTypeButton2.layer.borderWidth = 1.0
        ideaTypeButton2.layer.borderColor = UIColor.lightGray.cgColor
        ideaTypeButton2.titleLabel?.adjustsFontSizeToFitWidth = true
        
        ideaTypeButton3.layer.cornerRadius = 18.0
        ideaTypeButton3.layer.borderWidth = 1.0
        ideaTypeButton3.layer.borderColor = UIColor.lightGray.cgColor
        ideaTypeButton3.titleLabel?.adjustsFontSizeToFitWidth = true
        
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
        
        criteriaButton10.layer.cornerRadius = 18.0
        criteriaButton10.layer.borderWidth = 1.0
        criteriaButton10.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton10.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton11.layer.cornerRadius = 18.0
        criteriaButton11.layer.borderWidth = 1.0
        criteriaButton11.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton11.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton12.layer.cornerRadius = 18.0
        criteriaButton12.layer.borderWidth = 1.0
        criteriaButton12.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton12.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton13.layer.cornerRadius = 18.0
        criteriaButton13.layer.borderWidth = 1.0
        criteriaButton13.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton13.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton14.layer.cornerRadius = 18.0
        criteriaButton14.layer.borderWidth = 1.0
        criteriaButton14.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton14.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton15.layer.cornerRadius = 18.0
        criteriaButton15.layer.borderWidth = 1.0
        criteriaButton15.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton15.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton16.layer.cornerRadius = 18.0
        criteriaButton16.layer.borderWidth = 1.0
        criteriaButton16.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton16.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton17.layer.cornerRadius = 18.0
        criteriaButton17.layer.borderWidth = 1.0
        criteriaButton17.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton17.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton18.layer.cornerRadius = 18.0
        criteriaButton18.layer.borderWidth = 1.0
        criteriaButton18.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton18.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton19.layer.cornerRadius = 18.0
        criteriaButton19.layer.borderWidth = 1.0
        criteriaButton19.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton19.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton20.layer.cornerRadius = 18.0
        criteriaButton20.layer.borderWidth = 1.0
        criteriaButton20.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton20.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton21.layer.cornerRadius = 18.0
        criteriaButton21.layer.borderWidth = 1.0
        criteriaButton21.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton21.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton22.layer.cornerRadius = 18.0
        criteriaButton22.layer.borderWidth = 1.0
        criteriaButton22.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton22.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton23.layer.cornerRadius = 18.0
        criteriaButton23.layer.borderWidth = 1.0
        criteriaButton23.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton23.titleLabel?.adjustsFontSizeToFitWidth = true
        
        criteriaButton24.layer.cornerRadius = 18.0
        criteriaButton24.layer.borderWidth = 1.0
        criteriaButton24.layer.borderColor = UIColor.lightGray.cgColor
        criteriaButton24.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
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
    
    fileprivate func resetVC() {
        
                vcThemeColor = UIColor.lightGray
                turnOffButtonColor(selectedIdeaTypeButton)
                updateVCThemeColor()
                navigationController?.navigationBar.barTintColor = UIColor.white
                let _ = selectedIdeaCriteriaButton.map({ turnOffButtonColor($0) })
        
                selectedIdeaType = nil
                selectedIdeaTypeButton = nil
        
        
                selectedIdeaCriterias = []
                selectedIdeaCriteriaButton = []
        
                selectedIdeaPrice = nil
                selectedIdeaPriceButton = nil
        
                titleTextField.text = ""
                descriptionTextView.text = ""
        
                scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
}


///////////////////////////////
extension PostViewController: UITextFieldDelegate, UITextViewDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.descriptionTextView.becomeFirstResponder()
        
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        let scrollToPoint = Int(descriptionTextView.frame.minY) - 50
        
        UIView.animate(withDuration: 0.1) {
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: scrollToPoint)
        }
        
        return true
    }
    
    
    @objc func keyboardDidShow(notification: NSNotification) {
        
        var info = notification.userInfo!
        let keyBoardSize = info[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        scrollView.contentInset.bottom = keyBoardSize.height
        scrollView.scrollIndicatorInsets.bottom = keyBoardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        UIView.animate(withDuration: 0.25) {
            self.scrollView.contentInset.bottom = 0
            self.scrollView.scrollIndicatorInsets.bottom = 0
        }
    }
}


extension UIViewController {
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

