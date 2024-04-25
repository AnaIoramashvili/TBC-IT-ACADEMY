//
//  MainViewModel.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import Foundation

class MainViewModel {
    // MARK: - Properties
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    var countryCount: Int {
        return countries.count
    }
    
    // MARK: - Data Fetching
    func fetchCountries(completion: @escaping () -> Void) {
        guard let countriesURL = URL(string: "https://restcountries.com/v3.1/all") else {
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: countriesURL) { [weak self] data, response, error in
            guard let self = self, let data = data else {
                completion()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countriesData = try decoder.decode([Country].self, from: data)
                self.countries = countriesData
                completion()
            } catch {
                print("Error decoding countries data: \(error)")
                completion()
            }
        }.resume()
    }
    
}
