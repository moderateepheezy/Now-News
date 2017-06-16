//
//  WalkThroughVC.swift
//  now-news
//
//  Created by SimpuMind on 6/15/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit
import paper_onboarding
import SnapKit

class WalkThroughVC: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate  {

    let getStartedButton: UIButton = {
       let button = UIButton()
        button.setTitle("FINISH", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 22)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(white: 1, alpha: 0.4).cgColor
        button.layer.borderWidth = 0.79
        button.alpha = 0
        return button
    }()
    
    let onboardingView: PaperOnboarding = {
        let view = PaperOnboarding()
        view.alpha = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(getStartedButton)
        view.addSubview(onboardingView)
        
        getStartedButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-100)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerX.equalTo(view)
        }
        
        onboardingView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
        getStartedButton.addTarget(self, action: #selector(getStartedButtonDIdPressed), for: .touchUpInside)
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        
    }
    
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        
        let whiteColor = UIColor.white
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 30)!
        let descriptionFont = UIFont(name: "AvenirNext-DemiBold", size: 20)!
        
        let page1: OnboardingItemInfo = ("paper", "Welcome!", "This is a Onboarding. You'll now get notifications about nothing xD!", "", primaryColor, whiteColor, whiteColor, titleFont, descriptionFont)
        
        let page2: OnboardingItemInfo = ("information", "Design", "Design your apps", "", primaryColor, whiteColor, whiteColor, titleFont, descriptionFont)
        
        let page3: OnboardingItemInfo = ("cloud", "Grow", "Learn to code", "", primaryColor, whiteColor, whiteColor, titleFont, descriptionFont)
        
        let pages = [page1, page2, page3]
        
        return pages[index]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, animations: {
            self.onboardingView.alpha = 1
            print("You're in on the Onboarding Screen now!")
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getStartedButtonDIdPressed() {
        let vc = UIViewController()
        present(vc, animated: true, completion: nil)
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2{
            UIView.animate(withDuration: 0.3, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.bringSubview(toFront: self.getStartedButton)
                self.getStartedButton.alpha = 0
            })
        }
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    

}
