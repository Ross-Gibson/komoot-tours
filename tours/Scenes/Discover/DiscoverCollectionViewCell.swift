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
    @IBOutlet weak var distanceLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = nil
    }

    func configure(with tour: Tour) {
        nameLabel.text = tour.name
        distanceLabel.text = String(tour.distance)
    }

}
