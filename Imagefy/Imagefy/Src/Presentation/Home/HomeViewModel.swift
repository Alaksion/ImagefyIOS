//
//  HomeViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

struct HomeViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    
    private var page = 1
    
    init(_ repository: ImagefyRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPhotos(
        onResponse: @escaping ([FeedPhoto]) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        Task(priority: .background) {
            let response = await repository.getFeedPhotos(page: page)
            switch response {
            case .failure(let error):
                onError(error)
            case .success(let data):
                onResponse(data)
            }
        }
    }
    
}
