//
//  APIHandler.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler: NSObject {
    
    // Setup APIHandler as a Singleton class
    static let sharedInstance = APIHandler()
    private override init() {}
    
    // Using Alomafire make web service call and parse JSON data with codable
    func fetchUsers(with completionHandler: @escaping ([User], Error?) -> ()) {
        var userList = [User]()
        if let url = URL(string: AppConfiguration.urlString) {
            Alamofire.request(url).responseJSON { (response) in
                if (response.error == nil){
                    do {
                        let welcome = try JSONDecoder().decode(Welcome.self, from: response.data!)
                        let relatedTopicsArray = welcome.RelatedTopics
                        for item in relatedTopicsArray {
                            let text = item.Text
                            let textTuple = self.getTitleAndDescription(text: text)
                            let user = User.init()
                            user.title = textTuple.0
                            user.desc = textTuple.1
                            user.imgURLString = item.Icon.URL
                            if defaults.object(forKey: textTuple.0) != nil{
                                user.favorited = true
                            } else {
                                user.favorited = false
                            }
                            userList.append(user)
                        }
                        completionHandler(userList, nil)
                        
                    } catch {
                        completionHandler([],CustomError.parseError)
                    }
                }else{
                    completionHandler([], CustomError.fetchError)
                }
            }
        }else{
            completionHandler([], CustomError.incorrectUrl)
        }
    }
    
    // Saparate text and get the user name
    private func getTitleAndDescription(text: String) -> (String, String) {
        
        var title = ""
        var desc = ""
        if let index = text.index(of: "-") {
            var i = text.index(index, offsetBy: -1)
            title = String(text[..<i])
            i = text.index(index, offsetBy: 2)
            desc = String(text[i...])
        }else{
            title = text
            desc = text
        }
        return (title, desc)
    }
    
}
