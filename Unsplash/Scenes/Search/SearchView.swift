//
//  SearchView.swift
//  Unsplash
//
//  Created by SC on 2022/10/28.
//

import UIKit

class SearchView: BaseView {
    // MARK: - Properties
    let searchBar = UISearchBar().then {
        
//        $0.backgroundColor = .systemPink
        $0.placeholder = "검색하고 싶은 이미지의 키워드를 입력해 보세요"
//        $0.sizeToFit()
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        $0.backgroundColor = .systemMint
    }
    
//    private var dataSource: UICollectionViewDiffableDataSource<Int, SearchResult>!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    override func setUI() {
        collectionView.collectionViewLayout = createCollectionViewLayout()
    }
    
    override func setHierarchy() {  // addSubView, CollectionView init, SnapKit 구성 등
        // CollectionView init의 경우 프로퍼티 선언은 타입 선언만 묵시적 옵셔널 해제로 해 놓고 이니셜라이징을 여기에서 하는 건지❔
        [searchBar, collectionView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
//    private func configureDataSource() {
//        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, SearchResult> { cell, indexPath, itemIdentifier in
//            cell.likesLabel.text = "♥︎ \(itemIdentifier.likes)"
//
//            // String > URL > Data > Image
//            // 다운로드를 받는 동안 다른 작업을 할 수 있게 백그라운드 스레드에서 네트워크 통신 작업
//            DispatchQueue.global().async {
//                guard let url = URL(string: itemIdentifier.urls.thumb) else { return }
//
//                guard let data = try? Data(contentsOf: url) else { return }
//
//                DispatchQueue.main.async {  // UI 업데이트 시 main thread에서
//                    cell.photoImageView.image = UIImage(data: data)
//                }
//            }
//        }
//
//        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
//            let cell = collectionView.dequeueC†onfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
//            return cell
//        })
//    }
    
    // MARK: - Design Methods
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        // UICollectionLayoutListConfiguration + UICollectionViewCompositionalLayout.list(using:)
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//        layout.configuration  // UICollectionViewCompositionalLayoutConfiguration
        return layout
        
        // UICollectionViewCompositionalLayoutConfiguration
//        var configuration = UICollectionViewCompositionalLayoutConfiguration()
//        configuration.contentInsetsReference = .automatic
//        configuration.interSectionSpacing = 10
//
//        let layout = UICollectionViewCompositionalLayout(section: NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension., heightDimension: <#T##NSCollectionLayoutDimension#>))), configuration: <#T##UICollectionViewCompositionalLayoutConfiguration#>)
        
//        let layout2 = UICollectionViewCompositionalLayout(sectionProvider: <#T##UICollectionViewCompositionalLayoutSectionProvider##UICollectionViewCompositionalLayoutSectionProvider##(Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?#>, configuration: <#T##UICollectionViewCompositionalLayoutConfiguration#>)
        
//        UICollectionViewCompositionalLayoutConfiguration
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing
    }
}
