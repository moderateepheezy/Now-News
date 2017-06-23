//
//  BaseVC.swift
//  now-news
//
//  Created by SimpuMind on 6/20/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let button1 = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem  = button1
        
        let button2 = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(navDrawer))
        navigationItem.leftBarButtonItem  = button2
        
        
        let logo = UIImage(named: "Markicon")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    
    @objc private func navDrawer(){
        let vc = SlideNavVC()
        slideInTransitioningDelegate.direction = .drawer
        vc.transitioningDelegate = slideInTransitioningDelegate
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func search(){
        
    }


}
