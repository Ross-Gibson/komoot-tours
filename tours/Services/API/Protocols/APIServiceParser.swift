//
//  APIServiceParser.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

enum APIServiceParserError: Error {
    case invalidJSON
}

protocol APIServiceParser {
    func parse(responseData: Data, completion: @escaping ([Tour]) -> Void, failure: @escaping ErrorHandler)
}
