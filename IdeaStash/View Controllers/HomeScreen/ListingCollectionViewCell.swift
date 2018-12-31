//
//  ListingCollectionViewCell.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/19/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class ListingCollectionViewCell: UICollectionViewCell {
    
    var idea: Idea? {
        didSet {
            setLabels()
            
        }
    }
    
    @IBOutlet var posterIdeaType: UILabel!
    @IBOutlet var ideaTitleLabel: UILabel!
    @IBOutlet weak var ideaDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var localOrUniversalLabel: UILabel!
    
    func setLabels() {
        
        guard let idea = idea else { return }
        
        posterIdeaType.text = "\(idea.ideaType)"
        ideaTitleLabel.text = idea.title
        ideaDescriptionLabel.text = idea.description
        priceLabel.text = idea.price.rawValue
//        localOrUniversalLabel.text = idea.localOrUniversal.rawValue
        
    }
    
    @IBOutlet var customCellView: UIView!
    @IBOutlet var roundedWhiteViewBottom: UIView!
    @IBOutlet var MiddleWhiteViewSquared: UIView!
    
    var cellColor: UIColor? = nil
    
    override func awakeFromNib() {
        
    }
    
    func setCellColor() {
        
        switch idea!.ideaType {
        case .alone :
            cellColor = UIColor(named: Constants.coolBlue)
        case .family :
            cellColor = UIColor(named: Constants.coolOrange)
        case .friendsOrDate :
            cellColor = UIColor(named: Constants.rudeRed)
        }
    }
    
    func customUI() {
        
        customCellView.layer.backgroundColor = cellColor?.cgColor
        customCellView.layer.cornerRadius = 22.0
        customCellView.layer.cornerRadius = 22.0
        
        roundedWhiteViewBottom.layer.cornerRadius = 22.0
        
        customCellView.layer.shadowColor = cellColor?.cgColor
        customCellView.layer.shadowRadius = 4
        customCellView.layer.shadowOpacity = 1
        customCellView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}
