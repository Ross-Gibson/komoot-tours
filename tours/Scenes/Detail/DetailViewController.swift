//
//  DetailViewController.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

protocol DetailViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
}

final class DetailViewController: UIViewController, DetailViewControllerProtocol {

    var onBack: (() -> Void)?
    var viewModel: DetailViewModelProtocol?

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var elevationUpLabel: UILabel!
    @IBOutlet weak var elevationDownLabel: UILabel!

    lazy var backButton: UIBarButtonItem = {
        let image = UIImage(named: "chevron-left")?.withRenderingMode(.alwaysOriginal)
        return UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(back))
    }()

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = viewModel?.name
        durationLabel.text = viewModel?.duration
        distanceLabel.text = viewModel?.distance
        elevationUpLabel.text = viewModel?.elevationUp
        elevationDownLabel.text = viewModel?.elevationDown

        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = backButton
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let location = viewModel?.startPoint else {
            return
        }

        DispatchQueue.main.async {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            self.mapView.addAnnotation(annotation)
            self.focusMapOn(location)
        }

    }

    func focusMapOn(_ location: CLLocation, animated: Bool = true) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: animated)
    }

    // MARK: - Actions

    @objc func back() {
        self.onBack?()
    }

}
