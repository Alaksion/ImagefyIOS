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
}

struct ImagefyRemoteDataSource: ImagefyRemoteDataSourceProtocol, HttpClient {
    
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
    
}
