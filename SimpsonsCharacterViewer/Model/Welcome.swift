//
//  Root.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import Foundation

struct Welcome {
    let RelatedTopics: [RelatedTopic]
}

struct RelatedTopic {
    let Result, Text: String
    let Icon: Icon
}

struct Icon {
    let URL: String
}
