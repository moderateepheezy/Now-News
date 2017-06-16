//
//  CreateAccountVC.swift
//  now-news
//
//  Created by SimpuMind on 6/15/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

     var didSetupConstraints = false
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back_white"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    var bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "create_account_back")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var termsAndConditionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 11)
        button.alpha = 0.50
        return button
    }()
    
    var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        button.layer.cornerRadius = 27.5
        button.layer.borderColor = UIColor(white: 1, alpha: 0.4).cgColor
        button.layer.borderWidth = 0.79
        return button
    }()
    
    var passwordTextField: IconicTextField = {
        let tf = IconicTextField()
        tf.leftImage = #imageLiteral(resourceName: "Password")
        tf.font = UIFont(name: "Montserrat-Regular", size: 14)
        tf.layer.cornerRadius = 27.5
        tf.placeholder = "Password"
        tf.textColor = .white
        tf.leftPadding = 16
        tf.color = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return tf
    }()
    
    
    var nameTextField: IconicTextField = {
        let tf = IconicTextField()
        tf.leftImage = #imageLiteral(resourceName: "Name")
        tf.font = UIFont(name: "Montserrat-Regular", size: 14)
        tf.layer.cornerRadius = 27.5
        tf.placeholder = "Name"
        tf.textColor = .white
        tf.leftPadding = 16
        tf.color = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return tf
    }()
    
    var emailTextField: IconicTextField = {
        let tf = IconicTextField()
        tf.leftImage = #imageLiteral(resourceName: "Email")
        tf.font = UIFont(name: "Montserrat-Regular", size: 14)
        tf.layer.cornerRadius = 27.5
        tf.placeholder = "Email"
        tf.textColor = .white
        tf.leftPadding = 16
        tf.color = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return tf
    }()
    
    var createAccountLabel: UILabel = {
       let label = UILabel()
        label.text = "CREATE ACCOUNT"
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.applyGradient(colours: gradientColor)
        view.setNeedsUpdateConstraints()
        
        addingViewsAddSubViews()
        
        dismissButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func addingViewsAddSubViews(){
        view.addSubview(dismissButton)
        view.addSubview(bgImageView)
        view.addSubview(termsAndConditionButton)
        view.addSubview(continueButton)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createAccountLabel)
    }

}
