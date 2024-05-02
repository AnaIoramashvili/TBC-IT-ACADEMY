//
//  CatFactsViewModel.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import Foundation
import myNetworkPackage

class CatFactsViewModel {
    let networkService = NetworkService()

    func fetchCatFacts(completion: @escaping (Result<CatFactsResponse, Error>) -> Void) {
        networkService.getData(urlString: "https://catfact.ninja/facts?max_length=100&limit=100") { (result: Result<CatFactsResponse, Error>) in
            completion(result)
        }
    }
}
