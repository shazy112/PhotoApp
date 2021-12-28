import UIKit

class PhotosBaseViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchViewController()
    }
    
    /// Setting up SearchViewController in our base as to give user searching feature.
    private func setupSearchViewController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
