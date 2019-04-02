//
//  MasterViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import UIKit
import SDWebImage

class MasterViewController: UIViewController, ItemClickedProtocol {

    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    @IBOutlet weak var tbItem: UIBarButtonItem!
    
    private var displayListView = true
    private var displayFavorited = false
    private var dataSourceHandler : CollectionViewDataSourceHandler!
    private var delegateHandler: CollectionViewDelegateHandler!
    
    var viewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
        // overall setup method
    func setup() {
        
        setupSearchBar()
        setupViewModel()
        setupCollectionViewDelegateDataSource()
        setupCollectionView()
        setupAPI()
        
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = searchBarPlaceholder
    }
    
    func setupViewModel() {
        viewModel = UserViewModel()
    }
    
    func setupCollectionViewDelegateDataSource() {
        dataSourceHandler = CollectionViewDataSourceHandler(viewModel: viewModel)
        delegateHandler = CollectionViewDelegateHandler(viewModel: viewModel)
        userCollectionView.dataSource = dataSourceHandler
        userCollectionView.delegate = delegateHandler
        delegateHandler.delegate = self
    }
    
    func setupCollectionView() {
        tbItem.title = AppConfiguration.appName
    }
    
    // Make web service call and reload collection view
    func setupAPI() {
        viewModel.getItems { (error) in
            
            if error == nil {
                DispatchQueue.main.async {
                    self.userCollectionView.reloadData()
                }
            }
        }
    }
    
    // Enable favorate button selection
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        
        displayFavorited = !displayFavorited
        dataSourceHandler.displayFavorited = !dataSourceHandler.displayFavorited
        
        if displayFavorited {
            favoriteBtn.image = favoriteIcon
        }else{
            favoriteBtn.image = unfavoriteIcon
        }
        
        DispatchQueue.main.async {
            self.userCollectionView.reloadData()
        }
    }
    
    // Capture the segmentControl button value changed
    @IBAction func segmentControlValueChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            dataSourceHandler.displayListView = true
            displayListView = true
        case 1:
            dataSourceHandler.displayListView = false
            displayListView = false
        default:
            break
        }
        DispatchQueue.main.async {
            self.userCollectionView.reloadData()
        }
    }
    
    func collectionViewCellTapped(controller: DetailViewController) {
        controller.delegate = self
        splitViewController?.showDetailViewController(controller, sender: nil)
    }
    
    // Use the protocol method to get the cell bound
    func splitVCBound() -> CGSize {
        let bound = splitViewController?.primaryColumnWidth
        if displayListView {
            return CGSize(width: bound!, height: listViewCellHeight)
        }else{
            let width:CGFloat = (bound! - gridViewCellSpace)/numOfCellInRow
            return CGSize(width: width, height: width)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.userCollectionView.reloadData()
        }
    }
}

// conform to SearchBar delegate and favorite protocol
extension MasterViewController: UISearchBarDelegate, FavoriteProtocol {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
        viewModel.getFilteredCharacters(showFavorite: displayFavorited)
        DispatchQueue.main.async {
            self.userCollectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // Implement protocol method to get the favorite property
    func favoriteItem(user: User) {
        viewModel.favoriteUserAt(user: user)
        DispatchQueue.main.async {
            self.userCollectionView.reloadData()
        }
    }
}





