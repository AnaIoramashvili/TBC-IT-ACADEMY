//
//  CatFactsViewModel.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import Foundation

class CatFactsViewModel {
    func fetchCatFacts(completion: @escaping (Result<[CatFact], Error>) -> Void) {
        let url = URL(string: "https://catfact.ninja/facts?max_length=100&limit=100")!

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }

            do {
                let response = try JSONDecoder().decode(CatFactsResponse.self, from: data)
                completion(.success(response.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
