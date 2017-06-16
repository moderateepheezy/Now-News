//
//  CreateAccountVC+Extension.swift
//  now-news
//
//  Created by SimpuMind on 6/15/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

extension CreateAccountVC{
    
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            dismissButton.snp.makeConstraints { (make) in
                make.left.equalTo(view).offset(10)
                make.top.equalTo(view).offset(30)
                make.width.equalTo(35)
                make.height.equalTo(35)
            }
            
            bgImageView.snp.makeConstraints({ (make) in
                make.edges.equalTo(UIEdgeInsets.zero)
            })
            
            termsAndConditionButton.snp.makeConstraints({ (make) in
                make.bottom.equalTo(view).offset(-20)
                make.centerX.equalTo(view)
                make.height.equalTo(25)
                make.width.equalTo(150)
            })
            
            continueButton.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(view).offset(25)
                make.right.equalTo(view).offset(-25)
                make.bottom.equalTo(termsAndConditionButton.snp.top).offset(-20)
            })
            
            passwordTextField.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(view).offset(25)
                make.right.equalTo(view).offset(-25)
                make.bottom.equalTo(continueButton.snp.top).offset(-40)
            })
            
            emailTextField.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(view).offset(25)
                make.right.equalTo(view).offset(-25)
                make.bottom.equalTo(passwordTextField.snp.top).offset(-20)
            })
            
            nameTextField.snp.makeConstraints({ (make) in
                make.height.equalTo(55)
                make.left.equalTo(view).offset(25)
                make.right.equalTo(view).offset(-25)
                make.bottom.equalTo(emailTextField.snp.top).offset(-20)
            })
            
            createAccountLabel.snp.makeConstraints({ (make) in
                make.bottom.equalTo(nameTextField.snp.top).offset(-60)
                make.width.equalTo(200)
                make.height.equalTo(22)
                make.centerX.equalTo(view)
            })
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
