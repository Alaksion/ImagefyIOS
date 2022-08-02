//
//  UserProfileMapper.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 28/07/22.
//

import Foundation

class UserProfileMapper {
    
    private init() {}
    
    static func mapFromUserResponse(data: UserProfileResponse) -> UserProfile {
        return UserProfile(
            username: data.username,
            name: data.name,
            bio: data.bio ?? "",
            followersCount: data.followersCount,
            followingCount: data.followingCount,
            postsCount: data.totalPhotos,
            profileImageUrl: data.imageUrls.medium,
            instagramLink: buildSocialMediaLink(from: data.instagramUsername, withPrefix: "insta"),
            twitterLink: buildSocialMediaLink(from: data.twitterUsername, withPrefix: "twitter"),
            portfolioLink: buildPortfolioLink(from: data.portfolioUrl)
        )
    }
    
    private static func buildPortfolioLink(from url: String?) -> UserProfileLink? {
        guard let safeUrl = url else { return nil }
        return UserProfileLink(
            type: .other,
            label: "Portfolio",
            url: safeUrl
        )
    }
    
    private static func buildSocialMediaLink(
        from username: String?,
        withPrefix: String
    ) -> UserProfileLink? {
        guard let safeUsername = username else { return nil }
        return UserProfileLink(
            type: .instagram,
            label: safeUsername,
            url: withPrefix+safeUsername
        )
    }
    
}
