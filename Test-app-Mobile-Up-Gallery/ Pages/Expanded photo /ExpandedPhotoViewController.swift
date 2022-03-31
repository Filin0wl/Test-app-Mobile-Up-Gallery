//
//  ExpandedPhotoViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 01.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ExpandedPhotoDisplayLogic: AnyObject {
  func displayData(viewModel: ExpandedPhoto.Model.ViewModel.ViewModelData)
}

class ExpandedPhotoViewController: UIViewController, ExpandedPhotoDisplayLogic {

  var interactor: ExpandedPhotoBusinessLogic?
  var router: (NSObjectProtocol & ExpandedPhotoRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = ExpandedPhotoInteractor()
    let presenter             = ExpandedPhotoPresenter()
    let router                = ExpandedPhotoRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    func setupTopBar() {
        
        let shareIcon = UIImage(named: "ShareIcon")
        let backIcon = UIImage(named: "BackIcon")
        
        self.navigationItem.title = "data"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Display Semibold", size: 18)!]
        
        let shareButton = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(shareButton))
        shareButton.image = shareIcon
        self.navigationItem.rightBarButtonItem = shareButton
        
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backButton))
        backButton.image = backIcon
        self.navigationItem.rightBarButtonItem = backButton
    }
    
    @objc func shareButton(){
        //some code for share
    }
    
    @objc func backButton(){
        //some code for back
    }
  
  func displayData(viewModel: ExpandedPhoto.Model.ViewModel.ViewModelData) {

  }
  
}
