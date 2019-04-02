//
//  ItemCollectionViewCell.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func configureCell(viewModel: UserViewModel, displayListView: Bool, rowNum: Int) {
        
        // Differentiate cell data between list mode and grid mode
        userImageView.isHidden = displayListView
        titleLabel.isHidden = !displayListView
        favoriteButton.isHidden = !displayListView
        if displayListView {
            contentView.layer.shadowColor = UIColor.clear.cgColor // if in list mode remove shadow
            
            // if in list mode show user names and favorite button
            titleLabel.text = viewModel.getTitleAt(index: rowNum)
            favoriteButton.isSelected = viewModel.favoriteAt(index: rowNum)
        } else {
            contentView.setupShadow()
            
            // if in grid mode show images
            userImageView.sd_setImage(with: URL(string: viewModel.getImgURLStringAt(index: rowNum)!), placeholderImage: defaultImage, options: .refreshCached, completed: nil)
        }
    }
    

}


extension UIView {
    
    // Swtup image shadow
    func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
    }
}
