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
    let viewModel = SearchViewModel()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, SearchResult>!
    
    // MARK: - Life Cycle
    override func loadView() {
        view = searchView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()
        bindData()
    }
    
    private func bindData() {
        viewModel.photoList.bind { [weak self] photo in
            var snapshot = NSDiffableDataSourceSnapshot<Int, SearchResult>()
            snapshot.appendSections([0])
            snapshot.appendItems(photo.results)
            self?.dataSource.apply(snapshot)
        }
    }
    
    // MARK: - Setting Methods
    override func setHierarchy() {
        searchView.searchBar.delegate = self
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, SearchResult> { cell, indexPath, itemIdentifier in
            // 커스텀 셀에 UIListContentConfiguration 쓰는 방법 ❔
            cell.likesLabel.text = "􀊵 \(itemIdentifier.likes)"
            
            // String > URL > Data > Image
            // 다운로드를 받는 동안 다른 작업을 할 수 있게 백그라운드 스레드에서 네트워크 통신 작업
            DispatchQueue.global().async {
                guard let url = URL(string: itemIdentifier.urls.regular) else { return }
                
                guard let data = try? Data(contentsOf: url) else { return }
                
                DispatchQueue.main.async {  // UI 업데이트 시 main thread에서
                    cell.photoImageView.image = UIImage(data: data)
                }
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: searchView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            alert(title: "오류", message: "검색어를 찾을 수 없습니다.")
            return
        }
        
        viewModel.requestSearchPhoto(query: searchText)
        print(viewModel.photoList.value)
    }
}
