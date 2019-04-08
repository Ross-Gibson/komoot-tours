//
//  CoordinatorFactoryProtocol.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

protocol CoordinatorFactoryProtocol: class {
    func makeToursCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> ToursCoordinator
}
