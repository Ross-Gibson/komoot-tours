//
//  DiscoverModel.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

protocol DiscoverModelProtocol: class {
    var tours: [Tour] { get }
    func add(newTours: [Tour])
}

final class DiscoverModel: NSObject, DiscoverModelProtocol {
    var tours: [Tour] = []

    func add(newTours: [Tour]) {
        tours.append(contentsOf: newTours)
    }
}
