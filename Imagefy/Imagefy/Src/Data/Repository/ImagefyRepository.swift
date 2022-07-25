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
    
    func getFeedPhotos(page: Int) async -> Result<[FeedPhoto], RequestError> {
        let response = await dataSource.listPhotos(page: page)
        switch response {
        case .success(let data):
            return .success(data.map { photo in photo.mapToFeedPhoto()})
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
