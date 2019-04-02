
//
//  ItemViewModel.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

class UserViewModel {
    
    private var userList = [User]()
    private var favoriteUserList = [User]()
    private var filteredUserList = [User]()
    private var itemCount: Int = 0
    var searchText: String = ""
    
    func getItems (complete: @escaping (Error?) -> ()){
        APIHandler.sharedInstance.fetchUsers { (array, error) in
            if (error == nil){
                self.userList = array
                self.filteredUserList = array
                complete(nil)
            }else{
                complete(error)
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
    
    func favoriteAt(index: Int) -> Bool {
        return filteredUserList[index].favorited
    }
    
    // search on user list
    func getFilteredCharacters(showFavorite: Bool) {
        if showFavorite {
            if searchText.isEmpty {
                filteredUserList = favoriteUserList
            }else{
                filteredUserList = favoriteUserList.filter({
                    ($0.title?.uppercased().contains(searchText.uppercased()))!
                })
            }
        } else {
            if searchText.isEmpty {
                filteredUserList = userList
            }else{
                filteredUserList = userList.filter({
                    ($0.title?.uppercased().contains(searchText.uppercased()))!
                })
            }
            itemCount = filteredUserList.count
        }
    }
    
    // Search on the favorite user list
    func filterFavoriteList(){
        favoriteUserList = userList.filter({
            $0.favorited
        })
    }
    
    func favoriteUserAt(user: User){
        for chr in userList {
            if chr.title == user.title{
                chr.favorited = user.favorited
                break
            }
        }
    }
    
    
}
