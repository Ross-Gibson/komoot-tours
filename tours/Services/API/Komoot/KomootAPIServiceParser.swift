//
//  KomootAPIServiceParser.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation
import SwiftyJSON

final class KomootAPIServiceParser: APIServiceParser {
    func parse(responseData: Data, completion: @escaping ([Tour]) -> Void, failure: @escaping ErrorHandler) {
        do {
            let json = try JSON(data: responseData)

            if let toursData = json["_embedded"]["tours"].array {
                let tours = toursData.compactMap {
                    Tour(id: $0["id"].intValue, name: $0["name"].stringValue)
                }
                completion(tours)
            } else {
                failure(APIServiceParserError.invalidJSON)
            }
        } catch {
            failure(APIServiceParserError.invalidJSON)
        }
    }
}
