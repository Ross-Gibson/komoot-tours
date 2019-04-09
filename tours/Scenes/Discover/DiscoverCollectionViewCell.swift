//
//  DiscoverCollectionViewCell.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var elevationUpLabel: UILabel!
    @IBOutlet weak var elevationDownLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = nil
    }

    func configure(with tour: Tour) {
        // TODO: Ideally the cell should be configured with a view model,
        // where the data has already been formatted for display.
        // Also, this should be refactored to reduce the duplication between
        // the display data here, and the display data in the detail view.
        nameLabel.text = tour.name
        durationLabel.text = String(tour.duration) + " min" // TODO: format the time to use hours if neeeded
        distanceLabel.text = String(tour.distance.rounded(.awayFromZero)) + " m" // TODO: Use perfered unit, metric or imperial
        elevationUpLabel.text = String(Int(tour.elevationUp.rounded(.awayFromZero))) + " m" // TODO: Use perfered unit, metric or imperial
        elevationDownLabel.text = String(Int(tour.elevationDown.rounded(.awayFromZero))) + " m" // TODO: Use perfered unit, metric or imperial
    }

}
