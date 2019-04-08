//
//  ToursCoordinator.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

final class ToursCoordinator: BaseCoordinator {

    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory

    // MARK: - Init

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }

    // MARK: - Coordinator

    override func start() {
        self.showToursViewController()
    }

    // MARK: - Private methods

    private func showToursViewController() {
        let toursVC = self.viewControllerFactory.instantiateToursViewController()
        self.router.setRootModule(toursVC)
    }

}
