//
//  MainVC + Extensions.swift
//  Assignment22
//
//  Created by Ana on 5/9/24.
//

import UIKit

extension MainPageViewController: MainPageViewModelDelegate {
    func didFetchPhotos(_ photos: [Photo]) {
        self.photos = photos
        var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
        snapshot.appendSections([0])
        snapshot.appendItems(photos)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func didFailFetchingPhotos(_ error: Error) {
        print("Failed to fetch photos: \(error.localizedDescription)")
    }
}

extension MainPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullScreenViewController = FullScreenViewController(photos: photos, startIndex: indexPath.item)
        navigationController?.pushViewController(fullScreenViewController, animated: true)
    }
}



extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = collectionView.frame.width / 3 - 1
        if UIDevice.current.orientation.isLandscape {
            width = collectionView.frame.width / 6 - 1
        }
        return CGSize(width: width, height: width)
    }
}
