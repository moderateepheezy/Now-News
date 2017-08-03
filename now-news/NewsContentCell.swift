//
//  NewsContentCell.swift
//  now-news
//
//  Created by SimpuMind on 6/27/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class NewsContentCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Astronauts could land on Red Planet by 2039"
        label.font = UIFont(name: "Montserrat-Regular", size: 18)
        label.textColor = #colorLiteral(red: 0.1754441624, green: 0.1754441624, blue: 0.1754441624, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let channelIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "channel")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var channelNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CNN"
        label.font = UIFont(name: "Montserrat-Regular", size: 11)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var timeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Time")
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var timeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "20m ago"
        label.font = UIFont(name: "Montserrat-Regular", size: 11)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var categoryLabeL: UILabel = {
        let label = UILabel()
        label.text = "SCIENCE"
        label.font = UIFont(name: "Montserrat-Regular", size: 11)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        return label
    }()
    
    let categoryContainer: UIView = {
       let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let lineView: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(channelIcon)
        self.contentView.addSubview(channelNameLabel)
        self.contentView.addSubview(timeImageView)
        self.contentView.addSubview(timeNameLabel)
        self.contentView.addSubview(categoryContainer)
        categoryContainer.addSubview(categoryLabeL)
        categoryContainer.addSubview(lineView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        setupViews()
        
    }
    
    func setupViews(){
        
        let rect = Now.sharedIntance.getLabelHeight(text: categoryLabeL.text!, font: UIFont(name: "Montserrat-Regular", size: 11)!, frame: self.frame)
        
        categoryContainer.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-22)
            make.right.equalTo(self.snp.right).offset(-20)
            make.height.equalTo(15)
            make.width.equalTo(rect.width + 5)
        }
        
        categoryLabeL.snp.makeConstraints { (make) in
            make.left.equalTo(categoryContainer.snp.left)
            make.right.equalTo(categoryContainer.snp.right)
            make.height.equalTo(12)
            make.top.equalTo(categoryContainer)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(categoryContainer.snp.left)
            make.right.equalTo(categoryContainer.snp.right)
            make.height.equalTo(1)
            make.bottom.equalTo(categoryContainer)
        }
        
        channelIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.width.height.equalTo(20)
        }
        
        channelNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(channelIcon.snp.right).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-24)
            make.height.equalTo(12)
            make.width.equalTo(100)
        }
        
        timeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(channelNameLabel.snp.right).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.width.height.equalTo(20)
        }
        
        timeNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeImageView.snp.right).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-24)
            make.height.equalTo(12)
            make.width.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(24)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(52)
        }
    }

}
