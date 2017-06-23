//
//  SlideNavVC+Extension.swift
//  now-news
//
//  Created by SimpuMind on 6/23/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

extension SlideNavVC{
    
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            bgImageView.snp.makeConstraints({ (make) in
                make.edges.equalTo(UIEdgeInsets.zero)
            })
            
            profileImagView.snp.makeConstraints ({ (make) in
                make.right.equalTo(view).offset(-20)
                make.bottom.equalTo(view).offset(-40)
                make.width.height.equalTo(40)
            })
            
            usernameLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(view).offset(20)
                make.bottom.equalTo(view).offset(-40)
                make.height.equalTo(12)
                make.width.equalTo(150)
            })
            
            logoutLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(view).offset(20)
                make.bottom.equalTo(usernameLabel.snp.top).offset(-10)
                make.height.equalTo(12)
                make.width.equalTo(150)
            })
            
            lineView.snp.makeConstraints({ (make) in
                make.left.equalTo(view).offset(20)
                make.right.equalTo(view).offset(-20)
                make.bottom.equalTo(profileImagView.snp.top).offset(-20)
                make.height.equalTo(1)
            })
            
            tableView.snp.makeConstraints({ (make) in
                make.top.equalTo(view).offset(40)
                make.left.equalTo(view).offset(10)
                make.right.equalTo(view).offset(-10)
                make.bottom.equalTo(lineView.snp.top).offset(-40)
            })

            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
