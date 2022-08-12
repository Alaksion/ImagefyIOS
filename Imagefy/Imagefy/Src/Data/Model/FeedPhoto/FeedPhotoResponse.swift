//
//  FeedPhotoResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation
import UIKit

struct FeedPhotoResponse: Codable {
    let id : String
    let createdAt: String
    let updatedAt: String
    let color: String
    let likes: Int
    let description: String?
    let urls: FeedPhotoUrlsResponse
    let user: FeedPhotoAuthorResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case color
        case likes
        case description
        case urls
        case user
    }
    
    func mapToFeedPhoto() -> FeedPhoto {
        return FeedPhoto(
            authorName: self.user.name,
            authorUsername: self.user.username,
            id: self.id,
            createdAt: Date(),
            color: UIColor(hexString: self.color),
            likes: self.likes,
            description: self.description ?? "0",
            urls: self.urls.mapToPhotoUrls(),
            autorProfilePic: self.user.profileImages.small
        )
    }
}

struct FeedPhotoUrlsResponse : Codable {
    let raw: String
    let full: String
    let regular: String
    let thumb: String
    
    func mapToPhotoUrls() -> FeedPhotoUrls {
        return FeedPhotoUrls(
            raw: self.raw,
            full: self.full,
            regular: self.regular,
            thumb: self.thumb
        )
    }
}
