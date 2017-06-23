//
//  NavigationController.swift
//  now-news
//
//  Created by SimpuMind on 6/15/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController , UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.white
        let fontDictionary = [ NSForegroundColorAttributeName:UIColor.white]
        self.navigationBar.titleTextAttributes = fontDictionary
        self.navigationBar.barTintColor = primaryColor
    }
}
