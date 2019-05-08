//
//  UIViewController+Extension.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/8/19.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showGenericAlert(with message: String) {
        let alert = UIAlertController(title: Constant.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constant.alertButtonTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
