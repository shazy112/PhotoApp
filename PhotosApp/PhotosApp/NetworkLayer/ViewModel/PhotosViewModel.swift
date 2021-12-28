//
//  PhotosViewModel.swift
//  PhotosApp
//
//  Created by Sheearz Ahmed on 12/28/21.
//

import Foundation
protocol PhotosResponseDelegate: AnyObject {
    func success(photos: [Photos])
    func failure(message: String)
}

class PhotosViewModel {
    weak private var delegate: PhotosResponseDelegate?
    
    init(delegate: PhotosResponseDelegate) {
        self.delegate = delegate
        getPhotos(with: nil)
    }
    
    // Test case method to be tested in Unit Test if every string is an actual URL or not.
    func isConvertibleToURL(photo: Photos) -> Bool {
        guard let url = photo.webformatURL else {return false}
        return url.validURL
    }
    
    // Fetcher to fetch Photos from the Api and update the controller as soon as response is received
    func getPhotos(with parameters: [String: String]?) {
        ApiManager.shared.sendRequest(model: Album.self, parameters: parameters) {[weak self] result in
            switch result {
            case .success(let album):
                self?.delegate?.success(photos: album.photos)
            case .failure(let error):
                self?.delegate?.failure(message: error.localizedDescription)
            }
        }
    }
}
