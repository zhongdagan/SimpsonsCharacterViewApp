//
//  SimpsonsConfig.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import Foundation
import UIKit

// Setup different API and app name
struct AppConfiguration {
    static let urlString = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
    static let appName = "Simpsons Character Viewer"
}

// Using userDefault to persistant user data, will be different if we want to show different default image and place holder for iphone and iPad
let defaults = UserDefaults.standard
let defaultImage =  UIImage(named: "defaultImage")
let searchBarPlaceholder = "Search character"
