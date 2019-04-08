//
//  DetailViewModel.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation
import CoreLocation

protocol DetailViewModelProtocol {
    var tour: Tour { get }
    var name: String { get }
    var distance: String { get }
    var elevationUp: String { get }
    var elevationDown: String { get }
    var duration: String { get }
    var startPoint: CLLocation { get }
}

struct DetailViewModel: DetailViewModelProtocol {

    let tour: Tour

    var name: String {
        return tour.name
    }

    var distance: String {
        return String(tour.distance.rounded(.awayFromZero)) + " m" // TODO: Use perfered unit, metric or imperial
    }

    var elevationUp: String {
        return String(Int(tour.elevationUp.rounded(.awayFromZero))) + " m" // TODO: Use perfered unit, metric or imperial
    }

    var elevationDown: String {
        return String(Int(tour.elevationDown.rounded(.awayFromZero))) + " m" // TODO: Use perfered unit, metric or imperial
    }

    var duration: String {
        return String(tour.duration) + " min" // TODO: format the time to use hours if neeeded
    }

    var startPoint: CLLocation {
        return CLLocation(latitude: tour.lat, longitude: tour.lng)
    }

    init(with tour: Tour) {
        self.tour = tour
    }

}
