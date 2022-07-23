//
//  Author.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/07/22.
//

import Foundation

struct FeedPhotoAuthorResponse: Codable {
    let name: String
    let username: String
    let profileImages: FeedPhotoAuthorImageResponse
    
    enum CodingKeys: String, CodingKey {
        case name
        case username
        case profileImages = "profile_image"
    }
}

struct FeedPhotoAuthorImageResponse: Codable {
    let small: String
    let medium: String
    let large: String
}
