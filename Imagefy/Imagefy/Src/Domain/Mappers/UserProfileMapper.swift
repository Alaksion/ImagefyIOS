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
            links: buildUserProfileLinks(from: data),
            profileImageUrl: data.imageUrls.medium
        )
    }
    
    private static func buildUserProfileLinks(from response: UserProfileResponse) -> [UserProfileLinks] {
        var links : [UserProfileLinks] = []
        
        if let instagram = response.instagramUsername {
            let profile = UserProfileLinks(
                type: .instagram,
                label: instagram,
                url: ""
            )
            links.append(profile)
        }
        
        if let twitter = response.twitterUsername {
            let profile = UserProfileLinks(
                type: .twitter,
                label: twitter,
                url: ""
            )
            links.append(profile)
        }
        
        if let portfolio = response.portfolioUrl {
            let profile = UserProfileLinks(
                type: .other,
                label: "Portfolio",
                url: portfolio
            )
            links.append(profile)
        }
        
        return links
        
    }
}
