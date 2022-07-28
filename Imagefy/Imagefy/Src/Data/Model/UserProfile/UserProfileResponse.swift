//
//  UserProfileResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 28/07/22.
//

import Foundation

struct UserProfileResponse: Decodable {
    let id: String
    let name: String
    let username: String
    let instagramUsername: String?
    let twitterUsername: String?
    let portfolioUrl: String?
    let bio: String?
    let followingCount: Int
    let totalPhotos: Int
    let followersCount: Int
    let imageUrls: UserProfileImageResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case portfolioUrl = "portfolio_url"
        case bio
        case followingCount = "following_count"
        case totalPhotos = "total_photos"
        case followersCount = "followers_count"
        case imageUrls = "profile_image"
    }
}
