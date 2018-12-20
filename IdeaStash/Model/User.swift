//
//  User.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation


struct User {
    
    let firstName: String
    let lastName: String
    let username: String
    let bio: String
    let userID: String
    
    init(firstName: String, lastName: String, username: String, bio: String, userID: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.bio = bio
        self.userID = userID
        
    }
    
    init?(withDict dict: [String : Any]) {
        
        guard let firstName = dict[Constants.firstNameKey] as? String,
        let lastName = dict[Constants.lastNameKey] as? String,
        let username = dict[Constants.usernameKey] as? String,
        let bio = dict[Constants.bioKey] as? String,
        let userID = dict[Constants.userIDKey] as? String
        else { print("Error initializing user type from dictionary") ; return nil }
        
        self.init(firstName: firstName, lastName: lastName, username: username, bio: bio, userID: userID)
    }
    
    func getDocData() -> [String : Any] {
        
        let docData: [String : Any] = [
            Constants.firstNameKey : firstName,
            Constants.lastNameKey : lastName,
            Constants.usernameKey : username,
            Constants.bioKey : bio,
            Constants.userIDKey : userID
        
        ]
        return docData
    }
}
