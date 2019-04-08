//
//  DetailViewController.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit
protocol DetailViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
}

final class DetailViewController: UIViewController, DetailViewControllerProtocol {

    var onBack: (() -> Void)?
    var viewModel: DetailViewModelProtocol?

    @IBOutlet weak var nameLabel: UILabel!

    lazy var backButton: UIBarButtonItem = {
        let image = UIImage(named: "arrow-left")?.withRenderingMode(.alwaysOriginal)
        return UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(back))
    }()

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = viewModel?.name

        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = backButton
    }

    // MARK: - Actions

    @objc func back() {
        self.onBack?()
    }

}
