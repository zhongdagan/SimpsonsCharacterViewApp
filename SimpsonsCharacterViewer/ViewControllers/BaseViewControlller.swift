//
//  BaseViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import UIKit

class BaseViewControlller: UIViewController {

    override var title : String? {
        didSet {
            super.title = title?.uppercased()
        }
    }
   
}
