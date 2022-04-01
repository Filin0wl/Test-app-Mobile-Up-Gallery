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

    var photoUrl: String?
  var interactor: ExpandedPhotoBusinessLogic?
  var router: (NSObjectProtocol & ExpandedPhotoRoutingLogic)?

    @IBOutlet weak var photoVIew: UIImageView!
    
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
      self.setupTopBar()
  }
    
    func setupTopBar() {
        
        let shareIcon = UIImage(named: "ShareIcon")
        let backIcon = UIImage(named: "BackIcon")
        
        self.navigationItem.title = "data"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Display Semibold", size: 18)!]
        
        let shareButton = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(shareButton))
        shareButton.image = shareIcon
        shareButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = shareButton
        
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backButton))
        backButton.image = backIcon
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func shareButton(){
            guard let image = photoVIew.image else {
                showAlert(title: "Ошибка", message: "Ошибка получения изображения")
                return }
            let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            shareController.completionWithItemsHandler = {_, bool, _, error in
                if bool {
                    self.showAlert(title: "Сохранено!", message: "Изображение сохранено в ваши фотографии.")
                } else if error != nil {
                    self.showAlert(title: "Ошибка сохранения", message: "Изображение не сохранено")
                }
            }
            present(shareController, animated: true, completion: nil)
        }
    
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }

func showAlert(title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(okAction)
    present(alert, animated: true)
}
  
  func displayData(viewModel: ExpandedPhoto.Model.ViewModel.ViewModelData) {

  }
  
}
