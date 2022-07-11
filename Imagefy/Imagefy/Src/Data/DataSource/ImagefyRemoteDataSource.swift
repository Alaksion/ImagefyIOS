//
//  ImagefyRemoteDataSource.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

protocol ImagefyRemoteDataSourceProtocol {
    func listPhotos(page: Int) async -> Result<[FeedPhotoResponse], RequestError>
}

struct ImagefyRemoteDataSource: ImagefyRemoteDataSourceProtocol, HttpClient {
    
    func listPhotos(page: Int) async -> Result<[FeedPhotoResponse], RequestError> {
        return await sendRequest(
            endpoint: ImagefyService.listPhotos(page: page),
            responseModel: [FeedPhotoResponse].self
        )
    }
    
}
