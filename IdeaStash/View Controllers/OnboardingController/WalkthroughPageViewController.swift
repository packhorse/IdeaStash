//
//  WalkthroughPageViewController.swift
//  Walkthrough
//
//  Created by Porter Frazier on 1/7/19.
//  Copyright © 2019 BULB. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    var pageHeadings = ["Post Your Best Ideas For Other People To Find", "Discover Other People's Ideas", "Filter Through Those Ideas To Find Something Perfect For You."]
    var pageImages = ["onboarding1", "onboarding2 ", "onbaording3"]
    var pageSubHeadings = ["Pin your favorite cafes and create your own guide", "Search and locate your favorite cafes on maps", "Find cafes shared by your friends"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        delegate = self
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
            
        }
    }
    
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContent") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages [index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }

    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }

}


