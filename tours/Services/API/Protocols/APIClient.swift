//
//  APIClient.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

protocol APIClient {
    var service: APIService { get }
    var parser: APIServiceParser { get }
    func getTours(for user: String, completion: @escaping ([Tour]) -> Void, failure: @escaping ErrorHandler)
}
