//
//  GalleryInteractor.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 29.03.2022.
//

import Foundation

protocol GalleryBusinessLogic {
    func fetchPhotos()
}

class GalleryInteractor{
    
    // MARK: - External vars
    var presenter: GalleryPresentationLogic?
}

// MARK: - Bussiness logic
extension GalleryInteractor: GalleryBusinessLogic{
    func fetchPhotos() {
        presenter?.presentData()
        //some action
    }
}
