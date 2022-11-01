//
//  SearchError.swift
//  Unsplash
//
//  Created by SC on 2022/10/29.
//

import Foundation

enum SearchError: Int, Error {
    // 200 - OK: Everything worked as expected
    case badRequest = 400          // The request was unacceptable, often due to missing a required parameter
    case unauthorized = 401        // Invalid Access Token
    case forbidden = 403           // Missing permissions to perform request
    case notFound = 404            // The requested resource doesn’t exist
    case somethingWentWrong = 500  // Something went wrong on our end
    case somethingWentWrong2 = 503
}
