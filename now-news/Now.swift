//
//  Now.swift
//  now-news
//
//  Created by SimpuMind on 8/3/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

public class Now{
    
    static let sharedIntance = Now()
    
    func getLabelHeight(text: String, font: UIFont, frame: CGRect) -> CGRect{
        
        return  NSString(string: text).boundingRect(with: CGSize(width: frame.width, height: 1000) , options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin) , attributes: [NSFontAttributeName: font], context: nil)
    }
}
