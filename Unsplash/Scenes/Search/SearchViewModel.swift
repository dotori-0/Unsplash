//
//  SearchViewModel.swift
//  Unsplash
//
//  Created by SC on 2022/10/29.
//

import Foundation

class SearchViewModel {
    var photoList = CObservable(SearchPhoto(total: 0, totalPages: 0, results: []))
    
    func requestSearchPhoto(query: String) {
        APIService.searchPhoto(with: query) { [weak self] photo, statusCode, error in
            guard let statusCode = statusCode else {
//                self.photoList.
                return
            }
            
            guard let photo = photo else {
                return
            }
            
            self?.photoList.value = photo
        }
    }
}
