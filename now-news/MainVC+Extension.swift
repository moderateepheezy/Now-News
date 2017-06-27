//
//  MainVC+Extension.swift
//  now-news
//
//  Created by SimpuMind on 6/27/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

extension MainVC {
    
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            setUpHeader()
            
            tableView.snp.makeConstraints { (make) in
                make.top.equalTo(headerView.snp.bottom)
                make.width.equalTo(view)
                make.bottom.equalTo(view)
            }
            
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
