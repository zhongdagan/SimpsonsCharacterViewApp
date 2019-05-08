//
//  DetailViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewControlller {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // overall setup method
    func setup() {

        setupTitle()
        setupUI()
    }
    
    func setupTitle() {
        // set the toolbar visiblility on different devices
        let device = UIDevice.current.model
        if device == "iPhone" {
            title = user?.title
        } else {
            title = ""
        }
    }
    
    func setupUI() {
        if let imgURLString = user?.imgURLString{
            userImageView.sd_setImage(with: URL(string: imgURLString), placeholderImage: defaultImage, options: .refreshCached, completed: nil)
        }
        if let title = user?.title {
            titleLbl.text = title
        }
        if let desc = user?.description {
            descLbl.text = desc
        }
    }
    
}



