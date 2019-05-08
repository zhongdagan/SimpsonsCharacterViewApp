
//
//  ItemViewModel.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import UIKit

class UserViewModel {
    
    private var userList = [User]()
    private var filteredUserList = [User]()
    private var itemCount: Int = 0
    var searchText: String = ""
    
    func getItems (completion: @escaping (Error?) -> ()){
        APIHandler.sharedInstance.fetchUsers { array, error in
            if error == nil {
                self.userList = array
                self.filteredUserList = array
                completion(nil)
            }else{
                completion(error)
            }
        }
    }
    
    func getUserAt(index: Int) -> User {
        return filteredUserList[index]
    }
    
    func getFilteredUserListCount() -> Int {
        return filteredUserList.count
    }
    
    func getImgURLStringAt(index: Int) -> String? {
        return filteredUserList[index].imgURLString
    }
    
    func getTitleAt(index: Int) -> String? {
        return filteredUserList[index].title
    }
    
    // search on user list
    func getFilteredCharacters() {
        if searchText.isEmpty {
            filteredUserList = userList
        }else{
            filteredUserList = userList.filter({
                $0.title?.uppercased().contains(searchText.uppercased()) ?? false
            })
        }
        itemCount = filteredUserList.count
    }
    
}
