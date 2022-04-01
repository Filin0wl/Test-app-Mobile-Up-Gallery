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
    
    var getStaandartDate: String {
        let date = self.date
        let currentDate = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: NSLocalizedString("ru_RU", comment: "ru_RU"))
        dateFormatter.dateFormat = "d MMMM YYYY"
        return dateFormatter.string(from: currentDate)
    }
}

struct PhotoSize: Decodable {
    let url: String
    let type: String
    let height: Int
    let width: Int
}

