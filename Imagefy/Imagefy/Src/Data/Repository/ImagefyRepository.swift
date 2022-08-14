//
//  ImagefyRepository.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

struct ImagefyRepository: ImagefyRepositoryProtocol {

    private let dataSource: ImagefyRemoteDataSourceProtocol
    
    init(_ dataSource: ImagefyRemoteDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getPhotoDetails(withId id: String) async -> Result<PhotoDetails, RequestError> {
        return handleResponse(
            result: await dataSource.getPhoto(withId: id)
        ) { response in
            response.mapToDomain()
        }
    }
    
    func getFeedPhotos(page: Int) async -> Result<[FeedPhoto], RequestError> {
        return handleResponse(
            result: await dataSource.listPhotos(page: page)) { response in
                response.map { photo in
                    photo.mapToFeedPhoto()
                }
            }
    }
    
    func getUserProfile(username: String) async -> Result<UserProfile, RequestError> {
        return handleResponse(
            result: await dataSource.getUserProfile(
                username: username)
        ) { response in
            UserProfile(from: response)
        }
    }
    
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhoto], RequestError> {
        return handleResponse(
            result: await dataSource.getUserPhotos(
                username: username,
                page: page
            )
        ) { response in
            response.map { photo in
                photo.mapToUserPhoto()
            }
        }
    }
    
}
