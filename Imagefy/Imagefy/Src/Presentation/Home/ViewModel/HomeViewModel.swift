//
//  HomeViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation
import Caravel

final class HomeViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    
    private(set) var photos : [FeedPhoto] = []
    
    private var page: Int = 1
    private var isNextPageLoading = false
    
    var delegate: HomeViewModelDelegate?
    
    init(_ repository: ImagefyRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPhotos() {
        Task(priority: .background) {
            if shouldLoadNextPage() {
                isNextPageLoading = true
                let response = await repository.getFeedPhotos(page: page)
                handleResponse(data: response)
            }
        }
    }
    
    private func handleResponse(data: Result<[FeedPhoto], RequestError>) {
        switch data {
        case .failure(let error):
            delegate?.onError(error: error)
            isNextPageLoading = false
        case .success(let data):
            if page == 1 {
                delegate?.showNewState(newState: .ready)
            }
            photos.append(contentsOf: data)
            delegate?.onResponse(photos: self.photos)
            page = page + 1
            isNextPageLoading = false
        }
    }
    
    private func shouldLoadNextPage() -> Bool {
        if page == 1 {
            delegate?.showNewState(newState: .loading)
            return true
        }
        
        return page > 1 && !isNextPageLoading
    }
    
}
