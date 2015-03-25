//
//  ResultTableViewCell.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/20/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var subLabel: UILabel!
    var openLabel: UILabel!
    var openTimesLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let edgeOffset = 8.0
        let betweenLabelOffset = 2.0
        
        // Cleanup old labels
        self.textLabel?.removeFromSuperview()
        self.detailTextLabel?.removeFromSuperview()
        
        // Mess with background colors based on whether or not the cell is tapped
        
        
        // Accessory
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        
        // nameLabel
        self.nameLabel = UILabel()
        self.nameLabel.font = UIFont(name: "Raleway-SemiBold", size: 22.0)
        self.nameLabel.textColor = MyColors.darkGrey()
        self.nameLabel.numberOfLines = 0
        self.nameLabel.sizeToFit()
        self.addSubview(self.nameLabel)

        
        self.nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topMargin).with.offset(edgeOffset)
            make.left.equalTo(self.snp_leftMargin).with.offset(edgeOffset)
            make.width.equalTo(self.snp_width).multipliedBy(0.75)
        }
        
        // subLabel
        self.subLabel = UILabel()
        self.subLabel.font = UIFont(name: "Raleway-SemiBold", size: 12.0)
        self.subLabel.textColor = MyColors.mediumGrey()
        self.subLabel.numberOfLines = 0
        self.subLabel.sizeToFit()
        self.addSubview(self.subLabel)
        
        self.subLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.nameLabel.snp_bottom).offset(betweenLabelOffset)
            make.left.equalTo(self.nameLabel.snp_left)
            make.right.lessThanOrEqualTo(self.nameLabel.snp_right)
        }
        
        // openLabel
        self.openLabel = UILabel()
        self.openLabel.font = UIFont(name: "Raleway-Bold", size: 14.0)
        self.openLabel.textColor = MyColors.darkGrey()
        self.openLabel.numberOfLines = 0
        self.openLabel.sizeToFit()
        self.addSubview(self.openLabel)
        
        self.openLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subLabel.snp_bottom).offset(betweenLabelOffset)
            make.left.equalTo(self.nameLabel.snp_left)
        }
        
        // openTimesLabel
        self.openTimesLabel = UILabel()
        self.openTimesLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.openTimesLabel.textColor = MyColors.darkGrey()
        self.openTimesLabel.numberOfLines = 0
        self.openTimesLabel.sizeToFit()
        self.addSubview(self.openTimesLabel)
        
        self.openTimesLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.openLabel.snp_top)
            make.left.equalTo(self.openLabel.snp_right)
            make.right.lessThanOrEqualTo(self.nameLabel.snp_right)
            make.bottom.equalTo(self.snp_bottomMargin).with.offset(-edgeOffset)
        }
    }
    
    // required nonsense
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
