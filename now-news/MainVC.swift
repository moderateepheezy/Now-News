//
//  MainVC.swift
//  now-news
//
//  Created by SimpuMind on 6/23/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class MainVC: BaseVC {

    var didSetupConstraints = false
    
    let cellIndentifier = "cell"
    
    var headerView: CustomHeaderView!
    var headerHeightConstraint: NSLayoutConstraint!
    
    var height: CGFloat!

    
    var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.setNeedsUpdateConstraints()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        height = ((view.frame.height * 0.55) - 50)
        setUpHeader()
        addingViewsAddSubViews()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.register(NewsContentCell.self, forCellReuseIdentifier: cellIndentifier)
    }
    
    
    func setUpHeader() {
        headerView = CustomHeaderView(frame: CGRect.zero, title: "Hello World", img: "avatar_mg")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        if #available(iOS 9.0, *) {
            headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: height)
            headerHeightConstraint.isActive = true
            
            let constraints:[NSLayoutConstraint] = [
                headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
            
            
            
            
            NSLayoutConstraint.activate(constraints)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = height
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.45, options: UIViewAnimationOptions(), animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func addingViewsAddSubViews(){
        view.addSubview(tableView)
    }
    
    override func search(){
        print("Search got here")
    }
}


extension MainVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
            headerView.incrementColorAlpha(self.headerHeightConstraint.constant)
            headerView.incrementArticleAlpha(self.headerHeightConstraint.constant)
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 0 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            headerView.decrementColorAlpha(scrollView.contentOffset.y)
            headerView.decrementArticleAlpha(self.headerHeightConstraint.constant)
            
            if self.headerHeightConstraint.constant < 0 {
                self.headerHeightConstraint.constant = 0
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > height {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > height {
            animateHeader()
        }
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! NewsContentCell
        
        return cell
    }
}


