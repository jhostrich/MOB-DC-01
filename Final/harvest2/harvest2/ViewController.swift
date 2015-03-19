//
//  ViewController.swift
//  harvest2
//
//  Created by Johanna Ostrich on 3/14/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit
import Snap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = UIView()
        self.view.addSubview(view1)
        
        let padding = UIEdgeInsetsMake(10, 10, 10, 10)
            
        view1.snp_makeConstraints { (make) -> () in
//            make.top.equalTo(self.view.snp_top)
//            make.bottom.equalTo(self.view.snp_bottom)
//            make.leading.equalTo(self.view.snp_leading)
//            make.trailing.equalTo(self.view.snp_trailing)
//            make.top.equalTo(superview.snp_top).with.offset(padding.top) // with is an optional semantic filler
//            make.left.equalTo(superview.snp_left).with.offset(padding.left)
//            make.bottom.equalTo(superview.snp_bottom).with.offset(-padding.bottom)
//            make.right.equalTo(superview.snp_right).with.offset(-padding.right)
            
            make.height.equalTo(self.view.snp_height).multipliedBy(0.3333).with.offset(10)
            make.top.equalTo(0)
            make.centerX.equalTo(self.view.snp_centerX)
            make.width.equalTo(self.view.snp_width).with.offset(-100)
        }
        
            view1.backgroundColor = UIColor.greenColor()
        self.view.addSubview(view1)
        //view1.setTranslatesAutoresizingMaskIntoConstraints(false)

    
    }



}

