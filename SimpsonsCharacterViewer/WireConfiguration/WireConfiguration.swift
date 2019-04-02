//
//  WireConfig.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
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
let favoriteIcon = UIImage(named: "favorite")
let unfavoriteIcon = UIImage(named: "unfavorite")
let searchBarPlaceholder = "Search character"

// Prepare attibute for list and grid view
let numOfCellInRow: CGFloat = 2
let listViewCellHeight: CGFloat = 40
let gridViewCellSpace: CGFloat = 10
