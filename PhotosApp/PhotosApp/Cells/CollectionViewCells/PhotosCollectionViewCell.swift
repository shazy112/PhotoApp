//
//  HomePhotosCollectionViewCell.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 07/07/2021.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    var imageViewTappedCallback: ((UIImage) -> Void)?
    static let cellIdentifier = "photosCell"
    override func awakeFromNib() {
        prepareView()
    }
    
    private func prepareView() {
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        containerView.cornerRadius(with: 16.0)
        setupTapGestureForImageView()
    }
    
    func setupTapGestureForImageView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    /// This callback is invoked when imageview is tapped
    @objc private func imageViewTapped() {
        if let callback = imageViewTappedCallback, let image = imageView.image {
            callback(image)
        }
    }
    
    func setData(photo: Photos) {
        imageView.setImage(with: photo.photoUrl)
    }
}
