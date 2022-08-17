//
//  ApplicationContainer.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation

final class ApplicationContainer {
    
    static let instance = ApplicationContainer()
    
    private let repository: ImagefyRepositoryProtocol
    private let dataSource: ImagefyRemoteDataSourceProtocol
    private var homeViewModel: HomeViewModel?

    private init() {
        dataSource = ImagefyRemoteDataSource()
        repository = ImagefyRepository(dataSource)
    }
    
    func injectHomeViewModel() -> HomeViewModel {
        if let viewModel = homeViewModel {
            return viewModel
        }
        let newViewModel = HomeViewModel(repository)
        self.homeViewModel = newViewModel
        return newViewModel
    }
    
    func injectAuthorViewModel() -> AuthorProfileViewModel {
        return AuthorProfileViewModel(repository: repository)
    }
    
    func injectPostDetailsVm(postId: String) -> PostDetailsViewModel {
        return PostDetailsViewModel(repository, forPostWithId: postId)
    }
    
}
