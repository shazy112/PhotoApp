//
//  Extension+UIViewController.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 07/07/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// shows UIAlertController
    /// - Parameter message
    func showAlertView(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
///
