//
//  MainVC.swift
//  now-news
//
//  Created by SimpuMind on 6/23/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit
import ParallaxHeader

class MainVC: BaseVC {

    var didSetupConstraints = false
    
    let cellIndentifier = "cell"
    
    var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let height = ((view.frame.height * 0.55) - 50)
        
        self.automaticallyAdjustsScrollViewInsets = false
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: height) , title: "Hello World", img: "avatar_mg")
        addingViewsAddSubViews()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.alwaysBounceVertical = true
        tableView.parallaxHeader.view = headerView
        tableView.parallaxHeader.height = height
        tableView.parallaxHeader.minimumHeight = 10
        tableView.parallaxHeader.mode = .centerFill
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(NewsContentCell.self, forCellReuseIdentifier: cellIndentifier)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    
    func addingViewsAddSubViews(){
        view.addSubview(tableView)
    }
    
    override func search(){
        print("Search got here")
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


