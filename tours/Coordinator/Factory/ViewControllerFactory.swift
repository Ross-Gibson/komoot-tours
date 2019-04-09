//
//  ViewControllerFactory.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

final class ViewControllerFactory {

    func instantiateDiscoverViewController() -> DiscoverViewController {
        // TODO: Pull-out the identifier to a strings file
        let discoverVC = UIStoryboard.tours.instantiateViewController(withIdentifier: "DiscoverViewController") as! DiscoverViewController

        let service = KomootAPIService(authToken: "")
        let parser = KomootAPIServiceParser()
        let client = KomootAPIClient(service: service, parser: parser)

        discoverVC.viewModel = DiscoverViewModel(client: client)
        
        return discoverVC
    }

    func instantiateDetailViewController(with tour: Tour) -> DetailViewController {
        // TODO: Pull-out the identifier to a strings file
        let detailVC = UIStoryboard.tours.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.viewModel = DetailViewModel(with: tour)
        return detailVC
    }

}

