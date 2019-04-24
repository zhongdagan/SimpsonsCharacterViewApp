//
//  Root.swift
//  SimpsonsCharacterViewer
//
//  Created by Tan Zilong on 4/2/19.
//  Copyright © 2019 DyCom. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    
    let RelatedTopics: [RelatedTopic]
}

struct RelatedTopic: Codable {
    let Result, Text: String
    let Icon: Icon
}

struct Icon: Codable {
    let URL: String
    
}
