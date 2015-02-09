//
//  ViewController.swift
//  login
//
//  Created by Johanna Ostrich on 2/4/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ----- TITLE LABEL -----
        var titleLabel = UILabel(frame: CGRect(x: 50, y: 90, width: self.view.frame.width-100, height: 40))
        titleLabel.text = "LOGIN"
        
        self.view.addSubview(titleLabel)
        
        
        // ----- USERNAME -----
        var userTxtFld = UITextField(frame: CGRect(x: 50, y: 150, width: self.view.frame.width-100, height: 40))
        userTxtFld.placeholder = "Username"
        userTxtFld.borderStyle = UITextBorderStyle.RoundedRect
        userTxtFld.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        self.view.addSubview(userTxtFld)
        
        
        // ----- PASSWORD -----
        var passTxtFld = UITextField(frame: CGRect(x:50, y: 210, width: self.view.frame.width-100, height: 40))
        passTxtFld.placeholder = "Password"
        passTxtFld.borderStyle = UITextBorderStyle.RoundedRect
        passTxtFld.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        passTxtFld.secureTextEntry = true
        
        self.view.addSubview(passTxtFld)
        
        
        // ----- LOGIN BUTTON -----
        var loginBtn = UIButton(frame: CGRect(x:50, y: 270, width: self.view.frame.width-100, height: 40))
        loginBtn.setTitle("Login", forState: .Normal)
        loginBtn.addTarget(self, action: "pressedLoginBtn:", forControlEvents: .TouchUpInside)
        loginBtn.backgroundColor = UIColor.darkGrayColor()
        loginBtn.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        self.view.addSubview(loginBtn)
        
        
    }

    // ----- FOR LOGIN BUTTON -----
    func pressedLoginBtn(sender: UIButton) {
        println("You logged in!")
        goToSecondVC()
    }

    // How do I open a new module without the storyboard?
    func goToSecondVC() {
        
    }

}

