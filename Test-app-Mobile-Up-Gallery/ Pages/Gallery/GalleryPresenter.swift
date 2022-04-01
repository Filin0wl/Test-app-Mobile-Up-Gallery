//
//  GalleryPresenter.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GalleryPresentationLogic {
  func presentData(response: Gallery.Model.Response.ResponseType)
}

class GalleryPresenter: GalleryPresentationLogic {
  weak var viewController: GalleryDisplayLogic?
  
  func presentData(response: Gallery.Model.Response.ResponseType) {
      switch response {
      case .presentPhoto(photo: let photo):
          
          let cells = photo.items.map{ (photoItem) in
              cellViewModel(from: photoItem)
          }
          
          let photoVIewModel = PhotoViewModel.init(cells: cells)
          viewController?.displayData(viewModel: .displayPhotos(photoViewModel: photoVIewModel))
      }
  
  }
    
    private func cellViewModel(from photoItem: PhotoItem) -> PhotoViewModel.Cell {
        return PhotoViewModel.Cell.init(photoUrlString: photoItem.imageURL, date: photoItem.getStaandartDate)
    }
  
}
