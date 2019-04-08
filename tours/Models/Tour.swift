//
//  Tour.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

// TODO: We could implement the Decodable protocol
// and remove some of the parsing logic
struct Tour {
    let id: Int
    let name: String
    let elevationDown: Double
    let elevationUp: Double
    let distance: Double
    let duration: Int
    let lat: Double
    let lng: Double

    init(id: Int, name: String, elevationDown: Double, elevationUp: Double, distance: Double, duration: Int, lat: Double, lng: Double) {
        self.id = id
        self.name = name
        self.elevationDown = elevationDown
        self.elevationUp = elevationUp
        self.distance = distance
        self.duration = duration
        self.lat = lat
        self.lng = lng
    }
}
