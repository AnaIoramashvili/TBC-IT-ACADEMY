//
//  CountryCellViewModel.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import UIKit

class CountryCellViewModel {
    var countryName: String
    var flagURL: URL?

    init(countryName: String, flagURLString: String?) {
        self.countryName = countryName
        if let urlString = flagURLString {
            self.flagURL = URL(string: urlString)
        }
    }
}
