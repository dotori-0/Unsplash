//
//  SearchViewController.swift
//  Unsplash
//
//  Created by SC on 2022/10/28.
//

import UIKit

class SearchViewController: BaseViewController {
    // MARK: - Properties
    let searchView = SearchView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = searchView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function)
    }
    
    // MARK: - Setting Methods
    override func setHierarchy() {
        searchView.searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
}
