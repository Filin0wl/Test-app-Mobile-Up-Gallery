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

class GalleryViewController: UIViewController, GalleryDisplayLogic {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - External fileds
    var interactor: GalleryBusinessLogic?
    var router: (NSObjectProtocol & GalleryRoutingLogic)?
    
    
    //MARK: - Internal fileds
    private let networkService: Networking = NetworkService()
    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    private var photoViewModel = PhotoViewModel.init(cells: [])
    private var authService: AuthService!
    
    
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
        setup()
        self.setupTopBar()
        self.setupCollectionView()
        interactor?.makeRequest(request: .getPhotos)
        authService = SceneDelegate.shared().authService
    }
    
    func setupTopBar() {
        self.navigationItem.title = "Mobile Up Gallery"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Display Semibold", size: 18)!]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SF Pro Display Medium", size: 18)!], for: UIControl.State.normal)
        let loginButton = UIBarButtonItem(title: NSLocalizedString("Выход", comment: "Выход"), style: .plain, target: self, action: #selector(logoutButton))
        loginButton.tintColor = .black
        
        self.navigationItem.rightBarButtonItem = loginButton
    }
    
    @objc func logoutButton(){
        authService.logOut()
    }
    
    private func setupCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        view.addSubview(collectionView)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayPhotos(photoViewModel: let photoViewModel):
            self.photoViewModel = photoViewModel
            collectionView.reloadData()
        }

    }
    

}


//MARK: - Extension
extension GalleryViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModel.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        let cellViewModel = photoViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2)-1, height: (view.frame.width/2)-1)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVC = ExpandedPhotoViewController()
        
        let cellViewModel = photoViewModel.cells[indexPath.row]
        let url = cellViewModel.photoUrlString
        let date = cellViewModel.date
        photoVC.photoUrl = url
        photoVC.date = date
        
        //galleryManager.dateFormatter(viewController: photoVC, cellViewModel: cellViewModel)
        
        //galleryManager.backButton(navigationItem: self.navigationItem)
        
        navigationController?.pushViewController(photoVC, animated: true)
    }
}
