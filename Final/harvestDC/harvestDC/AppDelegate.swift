//
//  AppDelegate.swift
//  harvestDC
//
//  Created by Johanna Ostrich on 3/14/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit
//import Snap

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // -----------------
        // Customize nav bar
        // -----------------
        let navigationBarAppearance = UINavigationBar.appearance()
        
        // Nav buttons to white
        navigationBarAppearance.tintColor = UIColor.whiteColor()
        
        // Nav background to green
        navigationBarAppearance.barTintColor = UIColor(red: 64/255, green: 156/255, blue: 73/255, alpha: 0.9)
        
        // Status bar to white
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        
        
        // -----------
        // Parse Setup
        // -----------
        
        Parse.setApplicationId("cNvGSwJFZjU5nNB5TaF81XQtrgLHeIpiAXvH2e8w", clientKey: "uRnsDE06XWm68SRuNHx4j4LsEgIYdVZHFXSuNgdw")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

