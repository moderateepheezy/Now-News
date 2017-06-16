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
        self.navigationBar.setBackgroundImage(imageLayerForGradientBackground(), for: .default)
    }
    
    private func imageLayerForGradientBackground() -> UIImage {
        
        let frame = UIScreen.main.bounds
        let updatedFrame = CGRect(x: 0, y: 0, width: frame.width, height: 64)
        let layer = CAGradientLayer.gradientLayerForBounds(bounds: updatedFrame)
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
