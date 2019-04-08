//
//  DiscoverViewController.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

protocol DiscoverViewControllerProtocol: BaseViewControllerProtocol {
    var onShowDetail: ((Tour) -> Void)? { get set }
}

final class DiscoverViewController: UIViewController, DiscoverViewControllerProtocol {

    @IBOutlet var collectionView: UICollectionView!

    var onShowDetail: ((Tour) -> Void)?

    var viewModel: DiscoverViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel?.title
        viewModel?.delegate = self

        viewModel?.fetchTours()
    }
}

// MARK: - Extensions
// MARK: - UICollectionViewDataSource

extension DiscoverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfTours ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Pull-out the identifier to a strings file
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionViewCell", for: indexPath) as! DiscoverCollectionViewCell


        if let tour = viewModel?.tourForItemAt(index: indexPath.row) {
            cell.nameLabel.text = tour.name
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let columns: Int = {
            var count = 2
            if traitCollection.horizontalSizeClass == .regular {
                count = count + 1
            }
            if collectionView.bounds.width > collectionView.bounds.height {
                count = count + 1
            }
            return count
        }()
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(columns - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(columns))
        return CGSize(width: size, height: size)
    }
}

// MARK: - UICollectionViewDelegate

extension DiscoverViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let tour = viewModel?.tourForItemAt(index: indexPath.row) {
            self.onShowDetail?(tour)
        }
    }
}

// MARK: - DiscoverViewModelDelegate

extension DiscoverViewController: DiscoverViewModelDelegate {
    func onFetchCompleted() {
        self.collectionView.reloadData()
    }
}
