//
//  AppDelegate.swift
//  Test
//
//  Created by Ismael Ussefatt on 03/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var rootManager: RootModuleManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        rootManager = RootModuleManager(window: window)
        rootManager?.start()
        
        return true
    }
}

