//
//  GalleryModels.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Gallery {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getPhotos
      }
    }
    struct Response {
      enum ResponseType {
        case presentPhoto
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayPhotos
      }
    }
  }
  
}
