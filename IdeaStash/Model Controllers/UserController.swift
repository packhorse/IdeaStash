//
//  UserController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation



class UserController {
    
    static let shared = UserController()
    private init() {}
    
    var loggedInUser: User? {
        didSet {
            IdeaController.shared.getMyIdeas()
        }
    }
    
    func createNewUser(withFirstName firstName: String,
                       lastName: String,
                       username: String,
                       phone: String,
                       bio: String,
                       email: String,
                       password: String,
                       completion: @escaping (Bool) -> Void) {
        FirebaseManager.createFirebaseUser(withEmail: email, password: password) { (userID) in
            guard let userID = userID else {
                print("There was an error with creating a user in \(#function)")
                completion(false)
                return
            }
            
            let newUser = User(firstName: firstName, lastName: lastName, username: username, bio: bio, userID: userID)
            
            FirebaseManager.createUserProfile(withUser: newUser, completion: { (success) in
                if success {
                    print("A new user was successfully created")
                } else {
                    print("Failed to create a new user profile")
                }
                self.loggedInUser = newUser
                completion(true)
            })
        }
    }
    
    func signInUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        FirebaseManager.signInExistingUser(withEmail: email, password: password) { (loggedInUser) in
            guard let loggedInUser = loggedInUser else {
                print("Error logging user in")
                completion(false)
                return
            }
            
            
            self.loggedInUser = loggedInUser
            completion(false)
            return
        }
    }
    
    func fetchLoggedInUserProfile(completion: @escaping (Bool) -> Void) {
        
        FirebaseManager.fetchCurrentUserProfile { (user) in
            guard let user = user else {
                print("No user is signed into firebase on this device")
                completion(false)
                return
            }
            
            self.loggedInUser = user
            completion(true)
        }
    }
    
    func fetchUserProfile(withUsername username: String, completion: @escaping (User?) -> Void) {
        
        FirebaseManager.fetchUserProfile(withUsername: username) { (user) in
            guard let user = user else {
                print("Error trying to fetch user with the username: \(username)")
                completion(nil)
                return
            }
            
            completion(user)
        }
    }
    
    func logoutUser(completion: @escaping (Bool) -> Void) {
        
        do {
            try FirebaseManager.auth.signOut()
            loggedInUser = nil
            completion(true)
        } catch let error {
            print("Error: Could not sign out \n\(#function)\n\(error)\n\(error.localizedDescription)")
            completion(false)
        }
    }
    
    
}
