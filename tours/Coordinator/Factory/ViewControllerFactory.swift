//
//  ViewControllerFactory.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

final class ViewControllerFactory {

    func instantiateToursViewController() -> ToursViewController {
        // TODO: Pull-out the identifier to a strings file
        let toursVC = UIStoryboard.tours.instantiateViewController(withIdentifier: "ToursViewController") as! ToursViewController
        return toursVC
    }

}

