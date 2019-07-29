//
//  CustomCell.swift
//  Social_Table
//
//  Created by Nathaniel Mcdowell on 7/28/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
//import QuartzCore
class CustomCell: UITableViewCell {
    
    var cellData:CellData! {
        didSet {
            titleLabel.text = cellData.title
            featureImage.image = cellData.image
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        backgroundColor = .clear
        setupConstraints()
    }
    
    fileprivate func setupConstraints(){
        
        contentView.layer.cornerRadius = 5
    contentView.addSubview(featureImage)
        contentView.addSubview(titleLabel)
        
        
       
        featureImage.heightAnchor.constraint(equalToConstant: 105).isActive = true

        featureImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        featureImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        featureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width)
        //titleLabel.topAnchor.constraint(equalTo: featureImage.bottomAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Uh oh, init(coder:), no initializer!")
    }
    
    fileprivate var featureImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 5
        //////////////////////////
        iv.clipsToBounds = true
       // iv.layer.cornerRadius = 10
       // iv.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return iv
    }()
    
    fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColorFromRGB(rgbValue: 0xd9d9d9, alpha:0.77)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //label.mask?.layer.cornerRadius = 5
        //label.mask?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
    }
    
}
