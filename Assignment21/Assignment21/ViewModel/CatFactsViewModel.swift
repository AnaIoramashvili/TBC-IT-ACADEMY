//
//  CatFactsViewModel.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import Foundation
import myNetworkPackage

protocol CatFactsViewModelDelegate: AnyObject {
    func didFetchCatFacts(_ catFacts: [CatFact])
    func didFailFetchingCatFacts(_ error: Error)
}

class CatFactsViewModel {
    weak var delegate: CatFactsViewModelDelegate?
    let urlString = "https://catfact.ninja/facts?max_length=100&limit=100"
    
    func fetchCatFacts() {
        NetworkService().getData(urlString: urlString) { [weak self] (result: Result<CatFactsResponse, Error>) in
            switch result {
            case .success(let response):
                self?.delegate?.didFetchCatFacts(response.data)
            case .failure(let error):
                self?.delegate?.didFailFetchingCatFacts(error)
            }
        }
    }
}



