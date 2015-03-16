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
        
        let padding = UIEdgeInsetsMake(10, 10, 10, 10)
            
        view1.snp_makeConstraints { make in
            make.top.equalTo(superview.snp_top).with.offset(padding.top) // with is an optional semantic filler
            make.left.equalTo(superview.snp_left).with.offset(padding.left)
            make.bottom.equalTo(superview.snp_bottom).with.offset(-padding.bottom)
            make.right.equalTo(superview.snp_right).with.offset(-padding.right)
        }
        
            view1.backgroundColor = UIColor.greenColor()
        
    
    }



}

