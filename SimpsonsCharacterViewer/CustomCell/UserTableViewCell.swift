//
//  UserTableViewCell.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configureCell(viewModel: UserViewModel, rowNum: Int) {
        userNameLabel.text = viewModel.getTitleAt(index: rowNum)
    }
}
