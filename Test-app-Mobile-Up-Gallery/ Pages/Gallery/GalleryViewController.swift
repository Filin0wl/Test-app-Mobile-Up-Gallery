//
//  GalleryViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    private let networkService: Networking = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        let params = [API.idOwnerParameter: API.idOwner, API.idAlbumParameter: API.idAlbum]
        networkService.request(path: API.photo, params: params) {(data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let response = try? decoder.decode(PhotoResponseWrapper.self, from: data)
            print(response)
            
            }
        
    }

}
