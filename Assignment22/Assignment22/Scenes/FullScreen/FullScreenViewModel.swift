//
//  FullScreenViewModel.swift
//  Assignment22
//
//  Created by Ana on 5/9/24.
//

import Foundation

final class FullScreenViewModel {
    var photos: [Photo]
    var startIndex: Int
    
    init(photos: [Photo], startIndex: Int) {
        self.photos = photos
        self.startIndex = startIndex
    }
}
