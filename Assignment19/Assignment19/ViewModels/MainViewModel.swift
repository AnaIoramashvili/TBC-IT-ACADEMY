//
//  MainViewModel.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//


import Foundation
import UIKit

class MainViewModel {
    
    // MARK: - Properties
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    var countryCount: Int {
        return filteredCountries.count
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
                self.filteredCountries = countriesData
                completion()
            } catch {
                print("Error decoding countries data: \(error)")
                completion()
            }
        }.resume()
    }
}
    // MARK: - Search Functions

extension MainViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        
        return isActive && !searchText.isEmpty
    }
    
    func updateSearchResults(for searchText: String?) {
        
        guard let searchText = searchText?.lowercased(), !searchText.isEmpty else {
            self.filteredCountries = countries
            return
        }
        
        filteredCountries = countries.filter { country in
            if let commonName = country.name?.common?.lowercased() {
                return commonName.contains(searchText)
            }
            return false
        }
    }
}
