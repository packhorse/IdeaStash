//
//  ProfileViewController.swift
//  IdeaStash
//
//  Created by Porter Frazier on 12/19/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userBioLabel: UILabel!
    @IBOutlet weak var numberOfListingsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: Constants.myIdeasDidUpdateNotification, object: nil)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let collectionViewNib = UINib(nibName: "ListingCollectionViewCell", bundle: nil)
        
        collectionView.register(collectionViewNib, forCellWithReuseIdentifier: "listingCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIChanges()
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        
        presentActionSheet()
    }
    
    @objc func updateViews() {
        
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return IdeaController.shared.myIdeas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listingCell", for: indexPath) as? ListingCollectionViewCell else { return UICollectionViewCell() }
        
        let idea = IdeaController.shared.myIdeas[indexPath.row]
        
        cell.idea = idea
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfScreen = view.frame.width
        return CGSize(width: (widthOfScreen - 3 * 16) / 2 + 14, height: ((widthOfScreen - 3 * 16) / 2) + 80)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 10, bottom: 50, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var idea: Idea? = nil
        
        idea = IdeaController.shared.myIdeas[indexPath.row]
        
        let detailVC = ListingDetailViewController()
        
        detailVC.idea = idea
        present(detailVC, animated: true, completion: nil)
    }
    
    func UIChanges() {
        
        guard let currentUser = UserController.shared.loggedInUser else { return }
        
        nameLabel.text = "@\(currentUser.username)"
        userBioLabel.text = currentUser.bio
        numberOfListingsLabel.text = String(IdeaController.shared.myIdeas.count)
        
    }
    
    
    
    fileprivate func logoutUser() {
        
        UserController.shared.logoutUser { (successfulLogout) in
            if successfulLogout {
                self.tabBarController?.selectedIndex = 0
            }
        }
    }
    
    
    
    func presentActionSheet() {
        
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let logout = UIAlertAction(title: "Logout", style: .destructive) { (_) in
            self.logoutUser()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheetVC.addAction(logout)
        actionSheetVC.addAction(cancel)
        
        present(actionSheetVC, animated: true, completion: nil)
    }
    
}

