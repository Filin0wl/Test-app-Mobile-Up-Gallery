//
//  GalleryInteractor.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GalleryBusinessLogic {
  func makeRequest(request: Gallery.Model.Request.RequestType)
}

class GalleryInteractor: GalleryBusinessLogic {

  var presenter: GalleryPresentationLogic?
  var service: GalleryService?
    
  private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Gallery.Model.Request.RequestType) {
    if service == nil {
      service = GalleryService()
    }
      
      switch request {
      case .getPhotos:
          print("getPhotos interactor")
          fetcher.getGetPhotoFromAlbum { [weak self] (photoResponse) in
              guard let photoResponse = photoResponse else { return }
              self?.presenter?.presentData(response: .presentPhoto(photo: photoResponse))

              
          }
      }
  }
}
