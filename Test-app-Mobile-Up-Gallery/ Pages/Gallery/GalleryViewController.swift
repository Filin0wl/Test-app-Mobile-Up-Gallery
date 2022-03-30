//
//  GalleryViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 29.03.2022.
//

import UIKit

protocol GalleryDisplayLogic: AnyObject {
    func displayPhotos()
}

class GalleryViewController: UIViewController {
    
    //MARK: - External vars
    
    //MARK: - Internal vars
    private var interactor: GalleryBusinessLogic?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let presenter = GalleryPresenter()
        let interactor = GalleryInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: - Extension
extension GalleryViewController: GalleryDisplayLogic{
    func displayPhotos(){
        //some actions
    }
}
