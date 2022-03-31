//
//  ExpandedPhotoPresenter.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 01.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ExpandedPhotoPresentationLogic {
  func presentData(response: ExpandedPhoto.Model.Response.ResponseType)
}

class ExpandedPhotoPresenter: ExpandedPhotoPresentationLogic {
  weak var viewController: ExpandedPhotoDisplayLogic?
  
  func presentData(response: ExpandedPhoto.Model.Response.ResponseType) {
  
  }
  
}
