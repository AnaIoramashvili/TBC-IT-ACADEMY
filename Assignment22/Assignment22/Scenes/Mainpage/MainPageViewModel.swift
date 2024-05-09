//
//  MainPageViewModel.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//

import Foundation
import myNetworkPackage

protocol MainPageViewModelDelegate: AnyObject {
    func didFetchPhotos(_ photos: [Photo])
    func didFailFetchingPhotos(_ error: Error)
}

final class MainPageViewModel {
    weak var delegate: MainPageViewModelDelegate?
    
    let urlString = "https://api.unsplash.com/photos/?per_page=40&client_id=5GnBsOVc6oqM76DJW5_N0w0M_GcOardmpRJWUNogEdg"
    
    func fetchPhotos() {
        NetworkService().getData(urlString: urlString) { [weak self] (result: Result<[Photo], Error>) in
            switch result {
            case .success(let photos):
                self?.delegate?.didFetchPhotos(photos)
            case .failure(let error):
                self?.delegate?.didFailFetchingPhotos(error)
            }
        }
    }
}


