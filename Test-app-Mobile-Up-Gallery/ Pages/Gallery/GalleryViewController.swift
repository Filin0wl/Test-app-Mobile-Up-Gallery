//
//  GalleryViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    //MARK: - Internal fileds
    private let networkService: Networking = NetworkService()
    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        fetcher.getGetPhotoFromAlbum { (photoResponse) in
            guard let photoResponse = photoResponse else { return }
            photoResponse.items.map({ (photoItem) in
                print(photoItem.date)
            })

        }
        
    }

}
