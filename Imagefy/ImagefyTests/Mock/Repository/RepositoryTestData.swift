//
//  RepositoryTestData.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 12/08/22.
//

import Foundation
@testable import Imagefy


struct RepositoryTestData {
    private init() { }
    
    static let feedPhoto = FeedPhoto(
        authorName: "authorname",
        authorUsername: "username",
        id: "photo id",
        createdAt: Date.now,
        color: .red,
        likes: 10,
        description: "description",
        urls: FeedPhotoUrls(
            raw: "raw",
            full: "full",
            regular: "regular",
            thumb: "thumb"
        ),
        autorProfilePic: "authorpic"
    )
    
    static let userProfile = UserProfile(
        username: "username",
        name: "name",
        bio: "some bio",
        followersCount: 20,
        followingCount: 30,
        postsCount: 40,
        profileImageUrl: "profileImageUrl",
        instagramLink: UserProfileLink(
            type: .instagram,
            label: "label",
            url: "url"
        ),
        twitterLink: nil,
        portfolioLink: nil
    )
    
    static let userProfilePhoto = UserProfilePhoto(
        url: "url",
        color: .red,
        id: ""
    )
}
