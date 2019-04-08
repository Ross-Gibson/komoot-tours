//
//  KomootAPIServiceParser.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

final class KomootAPIServiceParser: APIServiceParser {
    func parse(responseData: Data, completion: @escaping ([Tour]) -> Void, failure: @escaping ErrorHandler) {
        do {
            guard let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                    failure(APIServiceParserError.invalidJSON)
                    return
            }

            // TODO: Parse JSON
            print(json)
            let tours: [Tour] = []
            completion(tours)
        } catch  {
            failure(APIServiceParserError.invalidJSON)
        }
    }
}
