//
//  FeedPhotoResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation

struct FeedPhotoResponse: Codable {
    let id : String
    let createdAt: String
    let updatedAt: String
    let color: String
    let likes: Int
    let description: String
    let urls: FeedPhotoUrlsResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case color
        case likes
        case description
        case urls
    }
}

struct FeedPhotoUrlsResponse : Codable {
    let raw: String
    let full: String
    let regular: String
    let thumb: String
}
