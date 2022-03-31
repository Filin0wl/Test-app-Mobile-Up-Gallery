//
//  PhotoResponse.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import Foundation

struct PhotoResponseWrapper: Decodable {
    let response: PhotoResponse
}

struct PhotoResponse: Decodable {
    var items: [PhotoItem]
}

struct PhotoItem: Decodable {
    let id: Int
    let date: Int
    let sizes: [PhotoSize]
    
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct PhotoViewModel {
    struct Cell: PhotoCellViewModel {
        var photoUrlString: String
        var date: Double
    }
    var cells: [Cell]
}
