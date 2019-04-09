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
        self.showDiscoverViewController()
    }

    // MARK: - Private methods

    private func showDiscoverViewController() {
        let discoverVC = self.viewControllerFactory.instantiateDiscoverViewController()
        discoverVC.onShowDetail = { [unowned self] tour in
            self.showDetailViewController(for: tour)
        }
        self.router.setRootModule(discoverVC)
    }

    private func showDetailViewController(for tour: Tour) {
        let detailVC = self.viewControllerFactory.instantiateDetailViewController(with: tour)
        detailVC.onBack = { [unowned self] in
            self.router.popModule(transition: FadeAnimator(animationDuration: 0.5, isPresenting: true))
        }
        self.router.push(detailVC, transition: FadeAnimator(animationDuration: 0.5, isPresenting: false))
    }

}
