//
//  Country.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import Foundation

struct Country: Codable {
    let name: Name?
    let flags: Flags?
    let officialName: String?
    let capital: [String]?
    let currencies: [String: Currency]?
    let region: String?
    let maps: Maps?
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Name: Codable {
    let common: String?
    let official: String?
}

struct Flags: Codable {
    let png: String?
    let alt: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}
