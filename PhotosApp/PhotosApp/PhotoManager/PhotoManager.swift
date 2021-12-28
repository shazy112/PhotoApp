import SDWebImage
import Foundation
import UIKit

extension UIImageView {
    
    /// Set fetched image from API
    /// - Parameter photoURL: takes url parameter as input and convert url to imageview through SDWebImage
    func setImage(with photoURL: URL?) {
        startActivityIndicator()
        if let url = photoURL {
            self.sd_setImage(with: url) {[weak self] responseImage, _, _, _ in
                if let photo = responseImage {
                    self?.image = photo
                }
                DispatchQueue.main.async {
                    self?.stopActivityIndicator()
                }
            }
        }
    }
}

extension UIView {
    /// Stops Activity indicator
    func stopActivityIndicator() {
        let activityIndicator = self.viewWithTag(999) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
    
    /// Setting up activity indicator
    func startActivityIndicator() {
        let activityIndicator =  UIActivityIndicatorView()
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.tag = 999
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
    }
}
