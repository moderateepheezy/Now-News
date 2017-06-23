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
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradientToView(rect: CGRect) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        let parentSize = UIScreen.main.bounds
        gradient.frame = CGRect(x: 0, y: 0, width: parentSize.width*(2.0/3.0), height: parentSize.height)
        gradient.colors = gradientColor.map { $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension CAGradientLayer {
    class func gradientLayerForBounds(bounds: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [primaryColor.cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return layer
    }
}


