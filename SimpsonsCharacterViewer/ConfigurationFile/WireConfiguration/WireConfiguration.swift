//
//  WireConfig.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import Foundation
import UIKit

// Customize error with Enum
enum CustomError: Error {
    
    case incorrectUrl
    case fetchError
    case parseError
    
    var localizedDescription: String {
        switch self {
        case .incorrectUrl:
            return "Incorrect URL"
        case .fetchError:
            return "Error in fetching data"
        case .parseError:
            return "Error in parsing the data"
        }
    }
}

// Setup different API and app name
struct AppConfiguration {

    static let urlString = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    static let appName = "The Wire Character Viewer"
    
}

// Using userDefault to persistant user data
let defaults = UserDefaults.standard
let defaultImage =  UIImage(named: "defaultImage")
let searchBarPlaceholder = "Search character"

