//
//  IdeaController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation


class IdeaController {
    
    
    static let shared = IdeaController()
    private init() {}
    
    var ideas = [Idea]() {
        didSet {
            NotificationCenter.default.post(name: Constants.ideaDidUpdateNotification, object: nil)
        }
    }
    
    var sortedIdeas = [Idea]() {
        didSet {
            NotificationCenter.default.post(name: Constants.sortedIdeasDidUpdateNotification, object: nil)
        }
    }
    
    
    var myIdeas = [Idea]() {
        didSet {
            NotificationCenter.default.post(name: Constants.myIdeasDidUpdateNotification, object: nil)
        }
    }
    
    
    var ideaTypeFilter: IdeaType? = nil {
        didSet {
//            sortIdeas()
        }
    }
    
    
    var ideaCriteriaFilters = [IdeaCriteria]() {
        didSet {
//            sortIdeas()
        }
    }
    
    var maxBudgetFilter: Int = Constants.maxPaySliderAmount {
        didSet {
//            sortIdeas()
        }
    }
    
    
    func postIdea(with title: String, description: String,
                  ideaType: IdeaType, criteria: [IdeaCriteria],
                  price: IdeaPrice, zipCode: String,
                  completion: @escaping (Bool) -> Void) {
        
        guard let loggedInUser = UserController.shared.loggedInUser else {
            print("Error: there is no logged in user \n\(#function)")
            completion(false)
            return 
        }
        
        let username = loggedInUser.username

        
        let idea = Idea(withTitle: title, description: description, ideaType: ideaType, criteria: criteria, price: price, zipCode: zipCode, username: username)
        
        FirebaseManager.postIdea(withIdea: idea) { (success) in
            if !success {
                print("Error with successfully posting idea \(#function)")
                completion(false)
                return
            }
            
            self.ideas.insert(idea, at: 0)
            self.myIdeas.insert(idea, at: 0)
            completion(true)
        }
    }
    
    func fetchAllIdeas(completion: @escaping (Bool) -> Void) {
        
        
        FirebaseManager.db.collection(Constants.ideaKey).getDocuments { (result, error) in
            if let error = error {
                print("There was an error, could not fetch all the ideas \(#function), \(error), \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let ideaDocs = result?.documents else { completion(false) ; return }
            
            let ideas = ideaDocs.compactMap({ Idea(withDict: $0.data()) })
            
            self.ideas = ideas.sorted(by: { $0.timestamp > $1.timestamp })
            completion(false)
        }
    }
 
//    func sortIdeas() {
//
//        var sortedIdeaPlaceholder = ideas.filter({$0.price <= maxBudgetFilter})
//
//        sortedIdeas = sortedIdeaPlaceholder
//
//        if jobCriteriaFilters.count > 0 {
//            sortedIdeaPlaceholder
//        }
//    }
//
//
//    func getMyIdeas() {
//
//        guard let currentUsername = UserControll
//    }
//
//
}
