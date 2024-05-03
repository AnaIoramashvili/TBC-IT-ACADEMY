//
//  CatFact.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//


import Foundation

struct CatFactsResponse: Decodable {
    let data: [CatFact]
}

struct CatFact: Decodable {
    let fact: String
    let length: Int
}
