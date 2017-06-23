//
//  SlideNavVC.swift
//  now-news
//
//  Created by SimpuMind on 6/23/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

 enum MenuOptions: Int {
    case NEWS
    case CHANNELS
    case BOOKMARKS
    case OVERVIEW
    case CALENDAR
    case TIMELINE
    case PROFILE
    case WIDGETS
    case SETTINGS
    
    static let mapper: [MenuOptions: String] = [

        NEWS: "news_nav",
        CHANNELS: "channel_nav",
        BOOKMARKS: "bookmark",
        OVERVIEW: "overview",
        CALENDAR: "calendar",
        TIMELINE: "timeline",
        PROFILE: "profile",
        WIDGETS: "widget",
        SETTINGS: "settings"
    
    ]
    
    var string: String {
        return String(describing: self)
    }
    
}

class SlideNavVC: UIViewController {

    var didSetupConstraints = false
    
    let identifier = "cell"
    
    var bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Imgimg_ba")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var profileImagView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "avatar_Img")
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    var logoutLabel: UIButton = {
        let button = UIButton()
        button.setTitle("LOG OUT", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Thomas Schnieder"
        label.font = UIFont(name: "Montserrat-Regular", size: 11)
        label.textColor = UIColor(white: 1, alpha: 0.5)
        return label
    }()
    
    var lineView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return view
    }()
    
    var tableView: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .clear
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.applyGradientToView(rect: view.bounds)
        view.setNeedsUpdateConstraints()
        
        addingViewsAddSubViews()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DrawerCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
    }
    
    func addingViewsAddSubViews(){
        view.addSubview(bgImageView)
        view.addSubview(profileImagView)
        view.addSubview(logoutLabel)
        view.addSubview(usernameLabel)
        view.addSubview(lineView)
        view.addSubview(tableView)
    }

}

extension SlideNavVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.mapper.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DrawerCell
        
        if let value = MenuOptions(rawValue: indexPath.item) {
            cell.titleLabel.text = value.string
            
            let mapper = MenuOptions.mapper[value]
            
            cell.iconImageView.image = UIImage(named: mapper!)
        }
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
}

class DrawerCell: UITableViewCell {
    
    var iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-Regular", size: 13)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(25)
            make.centerY.equalTo(self)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(20)
            make.right.equalTo(self).offset(10)
            make.centerY.equalTo(self)
        }
        
    }
    
}
