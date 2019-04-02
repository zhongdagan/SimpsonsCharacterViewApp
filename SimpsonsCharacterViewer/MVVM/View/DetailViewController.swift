//
//  DetailViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var tbItem: UIBarButtonItem!
    
    var user: User?
    var delegate: FavoriteProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // overall setup method
    func setup() {

        setupToolBarItemTitle()
        setupCollectionView()
    }
    
    func setupToolBarItemTitle() {
        // set the toolbar visiblility on different devices
        let device = UIDevice.current.model
        if device == "iPhone" {
            tbItem.isEnabled = true
            tbItem.title = user?.title
        } else {
            tbItem.isEnabled = false
            tbItem.tintColor = UIColor.clear
        }
    }
    
    func setupCollectionView() {
        
        if let imgURLString = user?.imgURLString{
            userImageView.sd_setImage(with: URL(string: imgURLString), placeholderImage: defaultImage, options: .refreshCached, completed: nil)
        }
        if let title = user?.title {
            titleLbl.text = title
            favoriteBtn.isSelected = (user?.favorited)! ? true : false
            favoriteBtn.isHidden = false
        }
        if let desc = user?.desc {
            descLbl.text = desc
        }
    }
    
    // Enable favorite button sellection
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        favoriteBtn.isSelected = !favoriteBtn.isSelected
        user?.favorited = !(user?.favorited)!
        if (user?.favorited)! {
            defaults.set(true, forKey: (user?.title)!)
        } else {
            defaults.removeObject(forKey: (user?.title)!)
        }
        delegate?.favoriteItem(user: user!)
    }
    
}

// Provide protocol to pass favorite property
protocol FavoriteProtocol {
    func favoriteItem(user: User)
}


