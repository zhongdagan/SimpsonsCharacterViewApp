//
//  CollectionViewDelegateHandler.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/30/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

class CollectionViewDelegateHandler : NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var viewModel: UserViewModel!
    var delegate: ItemClickedProtocol!
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get the Main storyboard
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.user = viewModel.getUserAt(index: indexPath.row)
        delegate.collectionViewCellTapped(controller: controller)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // provide delegate to change the layout
        return delegate.splitVCBound()
    }
}

// Provide delegate methods
protocol ItemClickedProtocol {
    func collectionViewCellTapped(controller: DetailViewController)
    func splitVCBound() -> CGSize
}
