//
//  Constants.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation

struct Constants {
    
    //This is for the collections in firestore
    static let usersTypeKey = "users"
    static let ideaKey = "idea"
    static let reportedIdeaTypeKey = "reportedListings"
    
    //These are for the documents
    static let titleKey = "title"
    static let descriptionKey = "description"
    static let ideaTypeKey = "ideaType"
    static let criteriaKey = "criteria"
    static let priceKey = "price"
    static let zipCodeKey = "zipCode"
    static let usernameKey = "username"
    static let timestampKey = "timestamp"
    static let localOrUniversal = "localOrUniversal"
    static let listingIDKey = "listingID"
    
    //Used for the keys in firestore documents
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let phoneKey = "phone"
    static let bioKey = "bio"
    static let userIDKey = "userID"
    
    static let ideaDidUpdateNotification = NSNotification.Name("ideaDidUpdateNotification")
    static let sortedIdeasDidUpdateNotification = NSNotification.Name("sortedIdeasDidUpdateNotification")
    static let myIdeasDidUpdateNotification = NSNotification.Name("myIdeasDidUpdateNotification")
    
    
    static let coolBlue = "CoolBlue"
    static let coolOrange = "CoolOrange"
    static let rudeRed = "RudeRed"
    

}
