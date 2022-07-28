//
//  UserProfile.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 28/07/22.
//

import Foundation

struct UserProfile {
    let username: String
    let name: String
    let bio: String
    let followersCount: Int
    let followingCount: Int
    let postsCount: Int
    let links: [UserProfileLinks]
    let profileImageUrl: String
}

extension UserProfile {
    init(from response: UserProfileResponse) {
        self = UserProfileMapper.mapFromUserResponse(data: response)
    }

}
