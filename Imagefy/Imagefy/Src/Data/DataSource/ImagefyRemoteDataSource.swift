//
//  ImagefyRemoteDataSource.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

protocol ImagefyRemoteDataSourceProtocol {
    func listPhotos(page: Int) async -> Result<[FeedPhotoResponse], RequestError>
    func getUserProfile(username: String) async -> Result<UserProfileResponse, RequestError>
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhotoResponse], RequestError>
    func getPhoto(withId id: String) async -> Result<PhotoDetailsResponse, RequestError>
}

struct ImagefyRemoteDataSource: ImagefyRemoteDataSourceProtocol, HttpClient {
    
    func getPhoto(withId id: String) async -> Result<PhotoDetailsResponse, RequestError> {
        return await sendRequest(endpoint: ImagefyService.getPhoto(withId: id))
    }
    
    func getUserProfile(username: String) async -> Result<UserProfileResponse, RequestError> {
        return await sendRequest(
            endpoint: ImagefyService.getUserProfile(username: username)
        )
    }
    
    func listPhotos(page: Int) async -> Result<[FeedPhotoResponse], RequestError> {
        return await sendRequest(
            endpoint: ImagefyService.listPhotos(page: page)
        )
    }
    
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhotoResponse], RequestError> {
        return await sendRequest(
            endpoint: ImagefyService.getUserPhotos(username: username, page: page)
        )
    }
    
}
