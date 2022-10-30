//
//  SearchCollectionViewCell.swift
//  Unsplash
//
//  Created by SC on 2022/10/28.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    // MARK: - Properties
    let photoImageView = UIImageView()
    let likesLabel = UILabel()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    override func setHierarchy() {
        [photoImageView, likesLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        likesLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
