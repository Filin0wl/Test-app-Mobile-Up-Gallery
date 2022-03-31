//
//  NetworkService.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 30.03.2022.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], complition: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService){
        self.authService = authService
    }
    
    func request(path: String, params: [String : String], complition: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        var allParams = params
        allParams[API.accessTokenParameter] = token
        allParams[API.versionParameter] = API.version
        let url = self.url(from: API.photo, params: allParams)
        let session = URLSession.init(configuration: .default)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                complition(data, error)
            }
        }
        task.resume()
        print(url)
        
    }
    
    func getPhoto() {
        
        guard let token = authService.token else { return }
        let params = [API.idOwnerParameter: API.idOwner, API.idAlbumParameter: API.idAlbum]
        var allParams = params
        allParams[API.accessTokenParameter] = token
        allParams[API.versionParameter] = API.version
        let url = self.url(from: API.photo, params: allParams)
        
        print(url)
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
