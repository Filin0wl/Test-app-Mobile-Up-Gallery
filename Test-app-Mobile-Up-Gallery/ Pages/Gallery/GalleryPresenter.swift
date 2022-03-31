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
      case .presentPhoto:
          print("presentPhoto Presenter")
          viewController?.displayData(viewModel: .displayPhotos)
      }
  
  }
  
}
