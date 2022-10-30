//
//  APIService.swift
//  Unsplash
//
//  Created by SC on 2022/10/29.
//

import Foundation
import Alamofire

class APIService {
    private init() { }
    
    static func searchPhoto(with query: String, completion: @escaping (SearchPhoto?, Int?, Error?) -> Void) {
        let url = Endpoint.searchPhotos + query
        let header: HTTPHeader = HTTPHeader(name: "Authorization", value: APIKey.unsplash)  // 헤더가 하나라면 이렇게 해도 될지? ❔
        
        AF.request(url, method: .get, headers: [header]).responseDecodable(of: SearchPhoto.self) { response in
            let statusCode = response.response?.statusCode
            switch response.result {
                case .success(let value): completion(value, statusCode, nil)
                case .failure(let error): completion(nil, statusCode, error)
            }
        }
    }
}
