//
//  HomeViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

class HomeViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    
    var photos : [FeedPhoto] = []
    var page: Int = 1
    private var isNextPageLoading = false
    
    var delegate: HomeViewModelDelegate?
    
    let imageLoader = DefaultImageLoader()
    
    init(_ repository: ImagefyRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPhotos() {
        Task(priority: .background) {
            if shouldLoadNextPage() {
                isNextPageLoading = true
                let response = await repository.getFeedPhotos(page: page)
                
                switch response {
                case .failure(let error):
                    delegate?.onError(error: error)
                    isNextPageLoading = false
                case .success(let data):
                    photos.append(contentsOf: data)
                    delegate?.onResponse()
                    page = page + 1
                    isNextPageLoading = false
                }
            }
        }
    }
    
    private func shouldLoadNextPage() -> Bool {
        if page == 1 {
            return true
        }
        
        return page > 1 && !isNextPageLoading
    }
    
}
