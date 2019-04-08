//
//  KomootAPIClient.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

final class KomootAPIClient: APIClient {

    let service: APIService
    let parser: APIServiceParser

    required init(service: APIService, parser: APIServiceParser) {
        self.service = service
        self.parser = parser
    }

    func getTours(for user: String, completion: @escaping ([Tour]) -> Void, failure: @escaping ErrorHandler) {
        service.getTours(for: user, completion: { data in
            self.parser.parse(responseData: data, completion: { tours in
                completion(tours)
            }, failure: { error in
                failure(error)
            })
        }, failure: { error in
            failure(error)
        })
    }
}
