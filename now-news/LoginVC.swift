//
//  LoginVC.swift
//  now-news
//
//  Created by SimpuMind on 6/14/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    var didSetupConstraints = false
    
    var activeField: UITextField?
    
    var bottomConstraint: Constraint? = nil
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    var bgImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Img")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var logoImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Mark")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var scrollView: UIScrollView = {
       let sv = UIScrollView()
        return sv
    }()
    
    var needHelpButton: UIButton = {
       let button = UIButton()
        button.setTitle("Need Help?", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 11)
        button.alpha = 0.50
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 11)
        button.alpha = 0.50
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        button.layer.cornerRadius = 27.5
        button.backgroundColor = primaryColor
        return button
    }()
    
    var passwordtextField: IconicTextField = {
        let tf = IconicTextField()
        tf.leftImage = #imageLiteral(resourceName: "Email")
        tf.font = UIFont(name: "Montserrat-Regular", size: 14)
        tf.layer.cornerRadius = 27.5
        tf.placeholder = "Password"
        tf.textColor = .white
        tf.leftPadding = 16
        tf.color = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return tf
    }()

    
    var usernameTextField: IconicTextField = {
        let tf = IconicTextField()
        tf.leftImage = #imageLiteral(resourceName: "Username")
        tf.font = UIFont(name: "Montserrat-Regular", size: 14)
        tf.layer.cornerRadius = 27.5
        tf.placeholder = "Username"
        tf.textColor = .white
        tf.leftPadding = 16
        tf.color = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.applyGradient(colours: gradientColor)
        view.setNeedsUpdateConstraints()

        
        addingViewsAddSubViews()
        
        usernameTextField.delegate = self
        passwordtextField.delegate = self
        
        createAccountButton.addTarget(self, action: #selector(showCreateAccount), for: .touchUpInside)
        
        getStartedButton.addTarget(self, action: #selector(showIntroScreen), for: .touchUpInside)
        
        
        
    }
    
    func showIntroScreen(){
        let vc = WalkThroughVC()
        present(vc, animated: true, completion: nil)
    }
    
    func addingViewsAddSubViews(){
        view.addSubview(bgImageView)
        view.addSubview(logoImageView)
        view.addSubview(scrollView)
        view.addSubview(needHelpButton)
        view.addSubview(createAccountButton)
        view.addSubview(getStartedButton)
        view.addSubview(passwordtextField)
        view.addSubview(usernameTextField)
    }
    
    func showCreateAccount(){
        let vc = CreateAccountVC()
        slideInTransitioningDelegate.direction = .left
        vc.transitioningDelegate = slideInTransitioningDelegate
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordtextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
    }
    

}
