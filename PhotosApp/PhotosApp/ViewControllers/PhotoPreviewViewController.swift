//
//  PhotoPreviewViewController.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 07/07/2021.
//

import UIKit
class PhotoPreviewViewController: UIViewController {
    
    @IBOutlet weak private var previewImageView: UIImageView!
    @IBOutlet weak private var closeButton: UIButton!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // setting up view
    private func prepareView() {
        setupImageView()
        setupCloseButton()
        setupSwipeDownGesture()
        self.view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
    }
    
    /// Calculates New Height based on device screen size to see full picture clearly.
    /// - Returns: New Height
    private func calculateImageHeightBasedOnScreen() -> CGFloat {
        if let displayImage = image {
            let ratio = displayImage.size.width / displayImage.size.height
            let newHeight = previewImageView.frame.width / ratio
            return newHeight
        }
        return 0.0
    }
    
    /// Setting up constraint & image for ImageView
    private func setupImageView() {
        previewImageView.image = image
        let imageHeight = calculateImageHeightBasedOnScreen()
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            previewImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previewImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16),
            previewImageView.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
    }
    
    /// Setting up close button to dismiss imageview
    private func setupCloseButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: previewImageView.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    /// Setting up swipe down gesture to dismiss the enlarged image
   private func setupSwipeDownGesture() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    /// Handling swipe down gesture
    @objc private func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .down {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
