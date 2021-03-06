//
//  APIHandler.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import Foundation
import Alamofire

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

class APIHandler {
    
    static let sharedInstance = APIHandler()
    
    func fetchUsers(with completionHandler: @escaping ([User], CustomError?) -> ()) {
        var userList = [User]()
        if let url = URL(string: AppConfiguration.urlString) {
            Alamofire.request(url).responseJSON { response in
                switch response.result {
                case .success(let json):
                    guard let json = json as? [String: Any], let relatedTopicsArray = json["RelatedTopics"] as? [[String: Any]] else { return completionHandler([], CustomError.parseError) }
                    for item in relatedTopicsArray {
                        let text = item[Constant.text] as? String
                        let textTuple = self.getTitleAndDescription(text: text)
                        let icon = item[Constant.icon] as? [String: String]
                        var user = User()
                        user.title = textTuple.0
                        user.description = textTuple.1
                        user.imgURLString = icon?[Constant.url]
                        userList.append(user)
                    }
                    completionHandler(userList, nil)
                case .failure:
                    completionHandler([], CustomError.fetchError)
                }
            }
        }else{
            completionHandler([], CustomError.incorrectUrl)
        }
    }
    
    // Saparate text and get the user name
    private func getTitleAndDescription(text: String?) -> (String?, String?) {
        var title: String?
        var desc: String?
        
        if let text = text, let index = text.index(of: "-") {
            var i = text.index(index, offsetBy: -1)
            title = String(text[..<i])
            i = text.index(index, offsetBy: 2)
            desc = String(text[i...])
        }
        return (title, desc)
    }
    
}
