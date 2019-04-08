//
//  KomootAPIService.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

final class KomootAPIService: APIService {

    private let authToken: String
    private let baseURL = "http://api.komoot.de/"
    private let apiVersion = "v007"

    required init(authToken: String) {
        self.authToken = authToken
    }

    func getTours(for user: String, completion: @escaping (Data) -> Void, failure: @escaping ErrorHandler) {
        let endpoint = "/users/\(user)/tours/"
        guard let url = URL(string: baseURL + apiVersion + endpoint) else {
            failure(APIServiceError.invalidURL)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Basic \(authToken)", forHTTPHeaderField: "Authorization")

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in

            guard error == nil else {
                failure(APIServiceError.badRequest)
                return
            }
            
            guard let responseData = data else {
                failure(APIServiceError.noData)
                return
            }

            completion(responseData)
        }
        task.resume()
    }
}
