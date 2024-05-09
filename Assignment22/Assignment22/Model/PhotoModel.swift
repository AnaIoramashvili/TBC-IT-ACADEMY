//
//  PhotoModel.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//

import Foundation
 
struct Photo: Decodable, Hashable {
    let id: String
    let urls: URLs
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
 
struct URLs: Decodable {
    let regular: String
}
