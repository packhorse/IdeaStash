//
//  ListingsViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/19/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class ListingsViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector : #selector(updateViews), name: Constants.myIdeasDidUpdateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: Constants.sortedIdeasDidUpdateNotification, object: nil)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        
        let collectionViewNib = UINib(nibName: "ListingCollectionViewCell", bundle: nil)
        
        collectionView.register(collectionViewNib, forCellWithReuseIdentifier: "listingCell")
        
        IdeaController.shared.fetchAllIdeas { (success) in
            if success {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") {
           print("break")
            return
        }
        
//        self.performSegue(withIdentifier: "toOnboarding", sender: self)
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        //broken bit
        if let walkthroughViewController = storyboard.instantiateInitialViewController() as? WalkthroughViewController {
            print("Walkthrough View Controller Created. 😭😭")
            present(walkthroughViewController, animated: true, completion: nil)
        }else{
            print("Walkthrough View Controller Failed To Create  🤬🤬")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        
    }
    

    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        
                IdeaController.shared.fetchAllIdeas { (_) in }
    }
    
    @objc func updateViews() {
        self.collectionView.reloadData()
    }
    
    
}

extension ListingsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if IdeaController.shared.ideaTypeFilter == nil &&
            IdeaController.shared.ideaCriteriaFilters.count == 0 &&
            IdeaController.shared.ideaPriceFilter == nil {
            return IdeaController.shared.ideas.count
        } else {
            return IdeaController.shared.sortedIdeas.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listingCell", for: indexPath) as? ListingCollectionViewCell else { return UICollectionViewCell() }
        
        var idea: Idea? = nil
        
        if IdeaController.shared.ideaTypeFilter == nil &&
        IdeaController.shared.ideaCriteriaFilters.count == 0 &&
            IdeaController.shared.ideaPriceFilter == nil {
            idea = IdeaController.shared.ideas[indexPath.row]
        } else {
            idea = IdeaController.shared.sortedIdeas[indexPath.row]
        }
        cell.idea = idea
        
        return cell
    }
    
    
}

extension ListingsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfScreen = view.frame.width
        return CGSize(width: (widthOfScreen - 3 * 16) / 2 + 14, height: ((widthOfScreen - 3 * 16) / 2) + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets (top: 30, left: 10, bottom: 50, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var idea: Idea? = nil
        
        if IdeaController.shared.ideaTypeFilter == nil &&
            IdeaController.shared.ideaCriteriaFilters.count == 0 &&
            IdeaController.shared.ideaPriceFilter == nil {
            idea = IdeaController.shared.ideas[indexPath.row]
        } else {
            idea = IdeaController.shared.sortedIdeas[indexPath.row]
        }
        
        let detailVC = ListingDetailViewController()
        
        detailVC.idea = idea
        present(detailVC, animated: true, completion: nil)
    }
    
}
