//
//  DataSourceStub.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 12/08/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel

final class DataSourceMock: ImagefyRemoteDataSourceProtocol {
    
    private(set) var listPhotoCalls: Int = 0
    private(set) var userProfileCalls: Int = 0
    private(set) var profilePhotosCalls: Int = 0
    
    func listPhotos(page: Int) async -> Result<[FeedPhotoResponse], RequestError> {
        listPhotoCalls += 1
        return .success([
            FeedPhotoResponse(
                id: "id",
                createdAt: "2016-05-03T11:00:28-04:00",
                updatedAt: "2016-05-03T11:00:28-04:00",
                color: "#ffffff",
                likes: 10,
                description: "a description",
                urls: FeedPhotoUrlsResponse(
                    raw: "raw",
                    full: "full",
                    regular: "regular",
                    thumb: "thumb"
                ),
                user: FeedPhotoAuthorResponse(
                    name: "name",
                    username: "some username",
                    profileImages: FeedPhotoAuthorImageResponse(
                        small: "small",
                        medium: "medium",
                        large: "large"
                    )
                )
            )
        ])
    }
    
    func getUserProfile(username: String) async -> Result<UserProfileResponse, RequestError> {
        userProfileCalls += 1
        return .success(UserProfileResponse(
            id: "id",
            name: "name",
            username: "username",
            instagramUsername: "instagram",
            twitterUsername: "twitter",
            portfolioUrl: "portfolio",
            bio: "somebio",
            followingCount: 10,
            totalPhotos: 10,
            followersCount: 10,
            imageUrls: UserProfileImageResponse(
                small: "small",
                medium: "medium",
                large: "large"
            )
        ))
    }
    
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhotoResponse], RequestError> {
        profilePhotosCalls += 1
        return .success([
            UserProfilePhotoResponse(
                id: "someId",
                width: 30,
                height: 30,
                color: "#ffffff",
                urls: UserProfilePhotoUrls(
                    small: "small", thumb: "thumb"
                )
            )
        ])
    }
    
    func getPhoto(withId id: String) async -> Result<PhotoDetailsResponse, RequestError> {
        return .success(
            PhotoDetailsResponse(
                id: "",
                color: "red",
                downloads: 10,
                likes: 10,
                description: nil,
                urls: PhotoDetailsLinksResponse(
                    raw: "",
                    regular: "",
                    full: "",
                    small: "",
                    thumb: ""
                )
            )
        )
    }
    
}
