//
//  NewsItem.swift
//  Assignemnt17
//
//  Created by Ana on 4/19/24.
//

import Foundation

struct NewsItem: Decodable {
    let title: String
    let time: String
    let photoUrl: String

    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case photoUrl = "PhotoUrl"
    }
}


