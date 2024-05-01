//
//  CatFact.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//


import Foundation

struct CatFactsResponse: Codable {
    let data: [CatFact]
}

struct CatFact: Codable {
    let fact: String
    let length: Int
}
