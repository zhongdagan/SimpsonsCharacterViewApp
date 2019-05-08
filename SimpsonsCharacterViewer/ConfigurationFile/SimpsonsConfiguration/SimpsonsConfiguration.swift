//
//  SimpsonsConfig.swift
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
            return "Error fetching data from the API"
        case .parseError:
            return "Error parsing the data"
        }
    }
}

// Setup different API and app name
struct AppConfiguration {
    static let urlString = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
    static let appName = "Simpsons Character Viewer"
}

// Using userDefault to persistant user data
let defaults = UserDefaults.standard
let defaultImage =  UIImage(named: "defaultImage")
let searchBarPlaceholder = "Search character"
