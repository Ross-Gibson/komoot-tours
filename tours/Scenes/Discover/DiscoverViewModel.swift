//
//  DiscoverViewModel.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

protocol DiscoverViewModelDelegate: class {
    func onFetchCompleted()
}

protocol DiscoverViewModelProtocol: class {
    var model: DiscoverModelProtocol { get }
    var delegate: DiscoverViewModelDelegate? { get set }
    var title: String { get }
    var client: APIClient { get }

    var numberOfTours: Int { get }
    func tourForItemAt(index: Int) -> Tour
    func fetchTours()
}

final class DiscoverViewModel: NSObject, DiscoverViewModelProtocol {

    var model: DiscoverModelProtocol
    weak var delegate: DiscoverViewModelDelegate?

    let client: APIClient

    private var isFetchInProgress: Bool = false

    var title: String {
        // TODO: Localise string
        return "Tours"
    }

    var numberOfTours: Int {
        return model.tours.count
    }

    required init(client: APIClient) {
        self.client = client
        self.model = DiscoverModel()
    }

    func fetchTours() {
        guard !isFetchInProgress else {
            return
        }

        isFetchInProgress = true

        let user = "471795703441"

        client.getTours(for: user, completion: { tours in
            DispatchQueue.main.async {
                self.model.add(newTours: tours)
                self.delegate?.onFetchCompleted()
            }
        }, failure: { error in
            switch error {
            case APIServiceError.invalidURL:
                // TODO: Handle the error
                print(error)
            case APIServiceError.badRequest:
                // TODO: Handle the error
                print(error)
            case APIServiceError.noData:
                // TODO: Handle the error
                print(error)
            case APIServiceParserError.invalidJSON:
                // TODO: Handle the error
                print(error)
            default:
                // TODO: Handle the error
                print(error)
            }
        })
    }

    func tourForItemAt(index: Int) -> Tour {
        return model.tours[index]
    }

}
