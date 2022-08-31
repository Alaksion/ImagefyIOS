//
//  ImagefyRepositoryMock.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 12/08/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel

final class ImagefyRepositoryMock: ImagefyRepositoryProtocol {
    
    private(set) var feedPhotosCalls = 0
    private(set) var userProfileCalls = 0
    private(set) var userPhotosCalls = 0
    
    var photoDetailsReturnsSuccess = true
    
    func getFeedPhotos(page: Int) async -> Result<[FeedPhoto], RequestError> {
        feedPhotosCalls += 1
        return .success([
            RepositoryTestData.feedPhoto,
            RepositoryTestData.feedPhoto,
            RepositoryTestData.feedPhoto
        ])
    }
    
    func getUserProfile(username: String) async -> Result<UserProfile, RequestError> {
        userProfileCalls += 1
        return .success(RepositoryTestData.userProfile)
    }
    
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhoto], RequestError> {
        userPhotosCalls += 1
        return .success([
            RepositoryTestData.userProfilePhoto,
            RepositoryTestData.userProfilePhoto,
            RepositoryTestData.userProfilePhoto
        ])
    }

    func getPhotoDetails(withId id: String) async -> Result<PhotoDetails, RequestError> {
        if photoDetailsReturnsSuccess {
            return .success(
                PhotoDetails(
                    id: "",
                    downloads: 10,
                    likes: 10,
                    color: .red,
                    links: PhotoDetailsLinks(
                        small: " ",
                        thumb: " ",
                        regular: " ",
                        full: "ue",
                        raw: "ee"
                    )
                )
            )
        } else {
            return .failure(.noResponse)
        }
    }
    
}
