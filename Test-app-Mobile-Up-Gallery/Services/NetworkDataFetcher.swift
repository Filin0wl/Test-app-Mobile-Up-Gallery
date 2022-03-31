//
//  NetworkDataFetcher.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 31.03.2022.
//

import Foundation

protocol DataFetcher {
    func getGetPhotoFromAlbum(response: @escaping (PhotoResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    let networking: Networking
    
    init(networking: Networking){
        self.networking = networking
    }
    
    func getGetPhotoFromAlbum(response: @escaping (PhotoResponse?) -> Void) {
        
        let params = [API.idOwnerParameter: API.idOwner, API.idAlbumParameter: API.idAlbum]
        networking.request(path: API.photo, params: params) {(data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoder = self.decodeJSON(type: PhotoResponseWrapper.self, from: data)
            response(decoder?.response)
    }
        
        
}
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T?{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
