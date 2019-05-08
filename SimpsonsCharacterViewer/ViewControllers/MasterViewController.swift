//
//  MasterViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import UIKit
import SDWebImage

class MasterViewController: BaseViewControlller {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = AppConfiguration.appName
        setupMasterView()
    }
    
        // overall setup method
    func setupMasterView() {
        setupSearchBar()
        setupViewModel()
        setupAPI()
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = searchBarPlaceholder
    }
    
    func setupViewModel() {
        viewModel = UserViewModel()
    }
    
    // Make web service call and reload collection view
    func setupAPI() {
        viewModel?.getItems { [weak self] error in
            if let error = error {
                self?.showGenericAlert(with: error.localizedDescription)
            } else {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.tableView.reloadData()
    }
    
}

// conform to SearchBar delegate protocol
extension MasterViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchText = searchText
        viewModel?.getFilteredCharacters()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
   
}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getFilteredCharacters()
        return viewModel?.getFilteredUserListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.userTableViewCell, for: indexPath) as? UserTableViewCell, let viewModel = viewModel else { return UITableViewCell() }
        
        cell.configureCell(viewModel: viewModel, rowNum: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = UIStoryboard(name: Constant.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constant.detailViewController) as? DetailViewController else { return }
        
        let user = viewModel?.getUserAt(index: indexPath.row)
        detailViewController.detailViewModel = DetailViewModel(title: user?.title, description: user?.description, characterUrl: user?.imgURLString)
        splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
    
}





