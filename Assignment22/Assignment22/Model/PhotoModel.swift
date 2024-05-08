//
//  PhotoModel.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let urls: URLs
}
 
struct URLs: Decodable {
    let regular: String
}
