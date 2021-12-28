//
//  Extension+ UIView.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 07/07/2021.
//

import Foundation
import UIKit

extension UIView {
    
    /// Corner radius for any particular view
    /// - Parameter radius: radius Value to curve
    func cornerRadius(with radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
