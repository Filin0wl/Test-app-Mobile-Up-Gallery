//
//  PhotoResponse.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import Foundation

struct PhotoResponse: Decodable {
    var items: [PhotoItem]
}

struct PhotoItem: Decodable {
    let sourseId: Int
    let albumId: Int
    let ownerId: Int
    let userId: Int
    let text: String
    let date: Int
    let size: [PhotoSize]
    
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let heigth: Int
}
