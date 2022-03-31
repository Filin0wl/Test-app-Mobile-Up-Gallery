//
//  ExpandedPhotoInteractor.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 01.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ExpandedPhotoBusinessLogic {
  func makeRequest(request: ExpandedPhoto.Model.Request.RequestType)
}

class ExpandedPhotoInteractor: ExpandedPhotoBusinessLogic {

  var presenter: ExpandedPhotoPresentationLogic?
  var service: ExpandedPhotoService?
  
  func makeRequest(request: ExpandedPhoto.Model.Request.RequestType) {
    if service == nil {
      service = ExpandedPhotoService()
    }
  }
  
}
