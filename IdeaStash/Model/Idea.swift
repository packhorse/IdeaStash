//
//  Idea.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/18/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation


struct Idea {
    
    
    let title: String
    let description: String
    let ideaType: IdeaType
    let criteria: [IdeaCriteria]
    let price: IdeaPrice
    let zipCode: String
    let username: String
    let timestamp: Date
    let localOrUniversal: String
    let listingID: String
    
    init(withTitle title: String, description: String, ideaType: IdeaType, criteria: [IdeaCriteria], price: IdeaPrice, zipCode: String, username: String, timestamp: Date = Date(), localOrUniversal: String, listingID: String = UUID().uuidString) {
        
        self.title = title
        self.description = description
        self.ideaType = ideaType
        self.criteria = criteria
        self.price = price
        self.zipCode = zipCode
        self.username = username
        self.timestamp = timestamp
        self.localOrUniversal = localOrUniversal
        self.listingID = listingID
        
    }
    
    init?(withDict dict: [String : Any]) {
        
        guard let title = dict[Constants.titleKey] as? String,
            let description = dict[Constants.descriptionKey] as? String,
            let ideaTypeAsString = dict[Constants.ideaTypeKey] as? String,
            let ideaType = IdeaType(rawValue: ideaTypeAsString),
            let criteriaAsStringArray = dict[Constants.criteriaKey] as? [String],
            let price = dict[Constants.priceKey] as? IdeaPrice,
            let zipCode = dict[Constants.zipCodeKey] as? String,
            let username = dict[Constants.usernameKey] as? String,
            let timestamp = dict[Constants.timestampKey] as? Date,
            let localOrUniversal = dict[Constants.localOrUniversal] as? String,
            let listingID = dict[Constants.listingIDKey] as? String
        else { print("Error initializing idea from type directory") ; return nil }
        
        let criteria = criteriaAsStringArray.compactMap({ IdeaCriteria(rawValue: $0) })
        
        self.init(withTitle: title, description: description, ideaType: ideaType, criteria: criteria, price: price, zipCode: zipCode, username: username, timestamp: timestamp, localOrUniversal: localOrUniversal, listingID: listingID)
        
        
        
    }
    
    
    func getDocDate() -> [String : Any] {
        
        
        let criteriaAsStringArray = criteria.map({ $0.rawValue })
        
        let docData: [String : Any] = [
        
            Constants.titleKey : title,
            Constants.descriptionKey : description,
            Constants.ideaTypeKey : ideaType.rawValue,
            Constants.criteriaKey : criteriaAsStringArray,
            Constants.priceKey : price,
            Constants.zipCodeKey : zipCode,
            Constants.usernameKey : username,
            Constants.timestampKey : timestamp,
            Constants.listingIDKey : listingID
        
        ]
        return docData
    }
}


enum IdeaType: String {
    
    case family
    case friendsOrDate
    case alone
    
}

enum IdeaCriteria: String {
    
    case adventurous
    case thrillful
    case hungry
    case indoors
    case outdoors
    case unique
    case scary
    case secret
    case romantic
    
}


enum IdeaPrice: String {
    
    case free
    case cheap
    case average
    case any
}
