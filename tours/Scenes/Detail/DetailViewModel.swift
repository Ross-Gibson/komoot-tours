//
//  DetailViewModel.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

protocol DetailViewModelProtocol {
    var tour: Tour { get }
    var name: String { get }
}

struct DetailViewModel: DetailViewModelProtocol {

    let tour: Tour

    var name: String {
        return tour.name
    }

    init(with tour: Tour) {
        self.tour = tour
    }

}
