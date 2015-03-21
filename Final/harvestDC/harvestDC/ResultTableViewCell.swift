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
    var boldLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Cleanup old labels
        self.textLabel?.removeFromSuperview()
        self.detailTextLabel?.removeFromSuperview()
        
        // Mess with background colors based on whether or not the cell is tapped
        
        
        // Accessory
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // nameLabel
        self.nameLabel = UILabel()
        self.nameLabel.font = UIFont(name: "Raleway-SemiBold", size: 22.0)
        self.nameLabel.numberOfLines = 0
        self.nameLabel.sizeToFit()
        self.addSubview(self.nameLabel)

        
        self.nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top)
            make.width.equalTo(self.snp_width).multipliedBy(0.75)
        }
        
        // subLabel
        self.subLabel = UILabel()
        self.subLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.subLabel.numberOfLines = 0
        self.subLabel.sizeToFit()
        self.addSubview(self.subLabel)
        
        self.subLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.nameLabel.snp_bottom)
//            make.height.equalTo(16.0)
            make.width.equalTo(self.snp_width).multipliedBy(0.75)
        }
        
        // boldLabel
        self.boldLabel = UILabel()
        self.boldLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.boldLabel.numberOfLines = 0
        self.boldLabel.sizeToFit()
        self.addSubview(self.boldLabel)
        
        self.boldLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subLabel.snp_bottom)
            make.bottom.equalTo(self.snp_bottom)
            make.width.equalTo(self.snp_width).multipliedBy(0.75)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
