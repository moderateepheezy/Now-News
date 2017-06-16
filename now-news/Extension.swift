//
//  Extension.swift
//  now-news
//
//  Created by SimpuMind on 6/14/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

let gradientColor = [UIColor(red: 249, green: 99, blue: 50), UIColor.black]
let primaryColor = UIColor(red: 249, green: 99, blue: 50)

extension UIColor{
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: [-0.10, 0.5, 1.0])
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        //gradient.locations = locations
        //gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        //gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
}


