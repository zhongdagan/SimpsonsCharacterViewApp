//
//  CollectionViewDataSourceHandler.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/30/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

class CollectionViewDataSourceHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var viewModel: UserViewModel!
    var displayFavorited: Bool!
    var displayListView: Bool!
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.displayFavorited = false
        self.displayListView = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // if display favorite users, filter the user array
        if displayFavorited {
            viewModel.filterFavoriteList()
        }
        
        viewModel.getFilteredCharacters(showFavorite: displayFavorited)
        return viewModel.getFilteredUserListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCollectionViewCell
        
        cell.configureCell(viewModel: viewModel, displayListView: displayListView, rowNum: indexPath.row)
        
        return cell
    }
}

