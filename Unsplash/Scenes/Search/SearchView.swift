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
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    // MARK: - Design Methods
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}
