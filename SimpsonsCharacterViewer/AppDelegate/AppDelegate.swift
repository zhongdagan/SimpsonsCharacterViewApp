//
//  AppDelegate.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureSplitViewController()
        return true
    }
    
}

extension AppDelegate: UISplitViewControllerDelegate {
    
    func configureSplitViewController(){
        guard let splitViewController = window?.rootViewController as? UISplitViewController else { return }
        
        splitViewController.delegate = self
        // display all the screens for iPad
        splitViewController.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
    }
    
}
