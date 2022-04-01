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
    
    private func getPropperSize() -> PhotoSize{
        if let sizeX = sizes.first(where: { $0.type == "x"}) {
            return sizeX
        } else if let fallBackSize = sizes.last {
            return fallBackSize
        } else {
            return PhotoSize(url:"wrong image", type: "wrong images", height: 0, width: 0 )
        }
    }
    
    var height: Int {
        return getPropperSize().height
    }
    
    var width: Int {
        return getPropperSize().width
    }
    
    var type: String {
        return getPropperSize().type
    }
    
    var imageURL: String {
        return getPropperSize().url
    }
}

struct PhotoSize: Decodable {
    let url: String
    let type: String
    let height: Int
    let width: Int
}

