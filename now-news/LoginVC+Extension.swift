//
//  LoginVC+Extension.swift
//  now-news
//
//  Created by SimpuMind on 6/14/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit


extension LoginVC{
    
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            
            bgImageView.snp.makeConstraints({ (make) in
                make.edges.equalTo(UIEdgeInsets.zero)
            })
            
            scrollView.snp.makeConstraints({ (make) in
                make.width.equalTo(view)
                make.height.equalTo(view.frame.height)
                make.centerX.equalTo(view.snp.centerX)
                bottomConstraint = make.bottom.equalTo(view).constraint
            })
            
            
            logoImageView.snp.makeConstraints({ (make) in
                make.top.equalTo(scrollView).offset(100)
                make.width.equalTo(110)
                make.height.equalTo(160)
                make.centerX.equalTo(scrollView)
            })
            
            needHelpButton.snp.makeConstraints({ (make) in
                make.bottom.equalTo(scrollView).offset(-20)
                make.right.equalTo(scrollView).offset(-25)
                make.height.equalTo(25)
                make.width.equalTo(100)
            })
            
            createAccountButton.snp.makeConstraints({ (make) in
                make.bottom.equalTo(scrollView).offset(-20)
                make.left.equalTo(scrollView).offset(25)
                make.height.equalTo(25)
                make.width.equalTo(100)
            })
            
            getStartedButton.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(scrollView).offset(25)
                make.right.equalTo(scrollView).offset(-25)
                make.bottom.equalTo(createAccountButton.snp.top).offset(-20)
            })
            
            passwordtextField.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(scrollView).offset(25)
                make.right.equalTo(scrollView).offset(-25)
                make.bottom.equalTo(getStartedButton.snp.top).offset(-20)
            })
            
            usernameTextField.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(scrollView).offset(25)
                make.right.equalTo(scrollView).offset(-25)
                make.bottom.equalTo(passwordtextField.snp.top).offset(-20)
            })

            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
