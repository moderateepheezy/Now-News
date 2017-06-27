//
//  CustomHeaderView.swift
//  now-news
//
//  Created by SimpuMind on 6/27/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {

    var colorView:UIView!
    var img: String?
    
    var articleIcon: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "header_img")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(white: 0, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Astronauts could land on Red Planet by 2039"
        label.font = UIFont(name: "Montserrat-Bold", size: 18)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    var chnnelIconImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "white_channel_icon")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()
    
    var channelNameLabel: UILabel = {
        let label = UILabel()
        label.text = "SPACE.com"
        label.font = UIFont(name: "Montserrat-Regular", size: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    var timeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "white_time_icon")
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var timeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "20m ago"
        label.font = UIFont(name: "Montserrat-Regular", size: 10)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    var categoryLabeL: UnderlinedLabel = {
        let label = UnderlinedLabel()
        label.text = "SCIENCE"
        label.font = UIFont(name: "Montserrat-Regular", size: 10)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    init(frame:CGRect,title: String, img: String) {
        self.img = img
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.white
        
        self.addSubview(articleIcon)
        self.addSubview(titleLabel)
        self.addSubview(channelNameLabel)
        self.addSubview(chnnelIconImageView)
        self.addSubview(timeImageView)
        self.addSubview(timeNameLabel)
        self.addSubview(categoryLabeL)
        
        addConstraintLayouts()
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        if #available(iOS 9.0, *) {
            let constraints:[NSLayoutConstraint] = [
                colorView.topAnchor.constraint(equalTo: self.topAnchor),
                colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
        } else {
            // Fallback on earlier versions
        }
        NSLayoutConstraint.activate(constraints)
        
        
        //colorView.backgroundColor = bgColor
        colorView.alpha = 0.6
        
        if #available(iOS 9.0, *) {
            let imageConstraints:[NSLayoutConstraint] = [
                articleIcon.topAnchor.constraint(equalTo: self.topAnchor),
                articleIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                articleIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                articleIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                articleIcon.topAnchor.constraint(equalTo: self.topAnchor),
                articleIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                articleIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                articleIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
            NSLayoutConstraint.activate(imageConstraints)
        } else {
            // Fallback on earlier versions
        }
        
        
        
    }
    
    func decrementColorAlpha(_ offset: CGFloat) {
        if self.colorView.alpha <= 1 {
            let alphaOffset = (offset/500)/85
            self.colorView.alpha += alphaOffset
        }
    }
    
    
    func decrementArticleAlpha(_ offset: CGFloat) {
        if self.articleIcon.alpha >= 0 {
            let alphaOffset = max((offset - 0)/85.0, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }
    func incrementColorAlpha(_ offset: CGFloat) {
        if self.colorView.alpha >= 0.6 {
            let alphaOffset = (offset/200)/85
            self.colorView.alpha -= alphaOffset
        }
    }
    func incrementArticleAlpha(_ offset: CGFloat) {
        if self.articleIcon.alpha <= 1 {
            let alphaOffset = max((offset - 0)/85, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }
    
    func addConstraintLayouts(){
        categoryLabeL.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.height.equalTo(12)
            make.width.equalTo(100)
        }
        
        chnnelIconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.width.height.equalTo(20)
        }
        
        channelNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(chnnelIconImageView.snp.right).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(20)
            make.height.equalTo(12)
            make.width.equalTo(100)
        }
        
        timeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(channelNameLabel).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.width.height.equalTo(20)
        }
        
        timeNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeImageView.snp.right).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(20)
            make.height.equalTo(12)
            make.width.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(chnnelIconImageView.snp.top).offset(-10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(52)
        }
    }
}

