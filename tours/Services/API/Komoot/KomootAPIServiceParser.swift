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

            // TODO: This is a basic approach to JSON decoding
            // I'm unsure of the Komoot API, so this has only
            // been tested with the data of my user.
            if let toursData = json["_embedded"]["tours"].array {
                dump(toursData)
                let tours = toursData.compactMap {
                    Tour(id: $0["id"].intValue,
                         name: $0["name"].stringValue,
                         elevationDown: $0["elevation_down"].doubleValue,
                         elevationUp: $0["elevation_up"].doubleValue,
                         distance: $0["distance"].doubleValue,
                         duration: $0["duration"].intValue,
                         lat: $0["start_point"]["lat"].doubleValue,
                         lng: $0["start_point"]["lng"].doubleValue)
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
