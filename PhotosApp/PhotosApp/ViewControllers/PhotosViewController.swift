import UIKit

class PhotosViewController: PhotosBaseViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    private var viewModel: PhotosViewModel?
    private var dataHandler = PhotosDataHandler()
    private (set) var cellName = "PhotosCollectionViewCell"
    private (set) var vcName = "PhotosViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    /// Preparing view
    private func prepareView() {
        self.title = "Search"
        searchController.searchResultsUpdater = self
        viewModel = PhotosViewModel(delegate: self)
        setupCollectionView()
    }
    
    // Setting up CollectionView and its data handler that handles all the responsibilities of CollectionView
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: PhotosCollectionViewCell.cellIdentifier)
        collectionView.dataSource = dataHandler
        collectionView.delegate = dataHandler
        dataHandler.didTapImageView = {[weak self] image in
            self?.showImagePreview(with: image)
        }
    }
    
    /// Show enlarged image when tapped on imageView
    /// - Parameter image: takes image as parameter to send to enlarge to new vc
    private func showImagePreview(with image: UIImage) {
        if let photosVc = self.storyboard?.instantiateViewController(identifier: vcName) as? PhotoPreviewViewController {
            photosVc.image = image
            photosVc.modalTransitionStyle = .crossDissolve
            photosVc.modalPresentationStyle = .overFullScreen
            present(photosVc, animated: true, completion: nil)
        }
    }
}
// MARK: - User Search query delegate
extension PhotosViewController: UISearchResultsUpdating {
    // Updates images result based on user search query
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        // If text is empty assign the initial fetched images otherwise fetch searched image
        text.isEmpty ? viewModel?.getPhotos(with: nil) : viewModel?.getPhotos(with: ["q": text])
    }
}

// MARK: - Api Response delegates
extension PhotosViewController: PhotosResponseDelegate {
    func success(photos: [Photos]) {
        dataHandler.photos = photos
        DispatchQueue.main.async {[weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func failure(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.view.stopActivityIndicator()
            self?.showAlertView(message: message)
        }
    }
}
