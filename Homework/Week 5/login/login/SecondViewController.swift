//
//  SecondViewController.swift
//  login
//
//  Created by Johanna Ostrich on 2/9/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ----- TITLE LABEL -----
        var titleLabel = UILabel(frame: CGRect(x: 50, y: 90, width: self.view.frame.width-100, height: 40))
        titleLabel.text = "You logged in successfully!"
        self.view.addSubview(titleLabel)
        
        
        // ----- BOX SCROLL VIEW -----
        var boxScrollView = UIScrollView(frame: CGRect(x: 50, y: 330, width: 200, height: 300))
        boxScrollView.backgroundColor = UIColor.whiteColor()
        boxScrollView.contentSize = CGSize(width: 200, height: 630)
        self.view.addSubview(boxScrollView)
        
        
        // ----- IMAGE 1 -----
        var babyImg = UIImage(named: "baby.jpg")
        var babyImgView = UIImageView(image: babyImg)
        babyImgView.frame = CGRect(x: 0, y: 0, width: babyImg!.size.width, height: babyImg!.size.height)
        
        // ----- IMAGE 2 -----
        var batmanImg = UIImage(named: "batman.jpg")
        var batmanImgView = UIImageView(image: batmanImg)
        batmanImgView.frame = CGRect(x: 0, y: 160, width:batmanImg!.size.width, height: batmanImg!.size.height)
        
        // ----- IMAGE 3 -----
        var fonzImg = UIImage(named: "theFonz.jpg")
        var fonzImgView = UIImageView(image: fonzImg)
        fonzImgView.frame = CGRect(x: 0, y: 320, width: fonzImg!.size.width, height: fonzImg!.size.height)
        
        // ----- IMAGE 4 -----
        var obamaImg = UIImage(named: "president.jpg")
        var obamaImgView = UIImageView(image: obamaImg)
        obamaImgView.frame = CGRect(x: 0, y: 480, width: obamaImg!.size.width, height: obamaImg!.size.height)
        
        boxScrollView.addSubview(babyImgView)
        boxScrollView.addSubview(batmanImgView)
        boxScrollView.addSubview(fonzImgView)
        boxScrollView.addSubview(obamaImgView)

    }


}
