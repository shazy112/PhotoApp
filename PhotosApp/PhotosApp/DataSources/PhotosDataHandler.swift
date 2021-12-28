//
//  HomePhotosDataSource.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 07/07/2021.
//

import Foundation
import UIKit

class PhotosDataHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var photos: [Photos] = []
    var didTapImageView: ((UIImage) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photosCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.cellIdentifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        photosCell.setData(photo: photos[indexPath.row])
        photosCell.imageViewTappedCallback = {[weak self] image in
            if let callback = self?.didTapImageView {
                callback(image)
            }
        }
        return photosCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /* Setting collection view cell size, dividing width by 2 of collectionview so 2 cells can be seen horizontally everytime,
         Setting up height by multiplying main screen size by 0.3 so it would be dynamic for all devices
         */
        
        return CGSize(width: collectionView.frame.size.width/2, height: UIScreen.main.bounds.height * 0.3)
    }
}
