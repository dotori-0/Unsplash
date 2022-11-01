//
//  SearchViewModel.swift
//  Unsplash
//
//  Created by SC on 2022/10/29.
//

import Foundation

class SearchViewModel {
    var photoList = CObservable(SearchPhoto(total: 0, totalPages: 0, results: []))
    
    func requestSearchPhoto(query: String, completionHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        APIService.searchPhoto(with: query) { [weak self] photo, statusCode, error in
            guard let statusCode = statusCode else {
                errorHandler()
                return
            }
            
            guard let photo = photo else {
                errorHandler()
                return
            }
            
            self?.photoList.value = photo
        }
    }
}
