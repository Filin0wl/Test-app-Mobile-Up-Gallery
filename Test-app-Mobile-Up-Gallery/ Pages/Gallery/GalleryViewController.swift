//
//  GalleryViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import UIKit

protocol GalleryDisplayLogic: AnyObject {
  func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData)
}

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GalleryDisplayLogic {
    
    //MAKR: - Outlets
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    //MARK: - External fileds
    var interactor: GalleryBusinessLogic?
    var router: (NSObjectProtocol & GalleryRoutingLogic)?
    
    //MARK: - Internal fileds
    private let networkService: Networking = NetworkService()
    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
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
      let interactor            = GalleryInteractor()
      let presenter             = GalleryPresenter()
      let router                = GalleryRouter()
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
        self.setupView()
        view.backgroundColor = .blue
        fetcher.getGetPhotoFromAlbum { (photoResponse) in
            guard let photoResponse = photoResponse else { return }
            photoResponse.items.map({ (photoItem) in
                print(photoItem.date)
            })
            

        }
        self.setupView()
        
    }
    
    func setupView() {
        self.setupTopBar()
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func setupTopBar() {
        self.navigationItem.title = "Mobile Up Gallery"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Display Semibold", size: 17)!]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SF Pro Display Medium", size: 18)!], for: UIControl.State.normal)
        let loginButton = UIBarButtonItem(title: NSLocalizedString("Выход", comment: "Выход"), style: .plain, target: self, action: nil)
        loginButton.tintColor = .black
        
        self.navigationItem.rightBarButtonItem = loginButton
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData) {

    }
    

}
