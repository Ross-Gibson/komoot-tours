//
//  APIService.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case badRequest
    case noData
}

protocol APIService {
    func getTours(for user: String, completion: @escaping (Data) -> Void, failure: @escaping ErrorHandler)
}
