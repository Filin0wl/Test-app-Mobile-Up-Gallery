//
//  Api.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 30.03.2022.
//

import Foundation

struct API
{
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.131"
    
    static let photo = "/method/photos.get"
    
    static let idOwner = "-128666765"
    static let idAlbum = "266276915"
    
    static let idOwnerParameter = "owner_id"
    static let idAlbumParameter = "album_id"
    
    static let accessTokenParameter = "access_token"
    static let versionParameter = "v"
}
