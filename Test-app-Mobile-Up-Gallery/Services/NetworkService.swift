//
//  NetworkService.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 30.03.2022.
//

import Foundation

final class NetworkService{
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService){
        self.authService = authService
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
