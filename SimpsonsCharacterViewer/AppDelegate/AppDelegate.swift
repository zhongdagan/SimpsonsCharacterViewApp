//
//  AppDelegate.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureSplitViewController()
        return true
    }
    
    func configureSplitViewController(){
        
        guard let splitViewController = window?.rootViewController as? UISplitViewController else {return}
        splitViewController.delegate = self
        
        // display all the screens for iPad
        splitViewController.preferredDisplayMode = .allVisible
        
    }
}


extension AppDelegate: UISplitViewControllerDelegate {
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
    }
    
}
