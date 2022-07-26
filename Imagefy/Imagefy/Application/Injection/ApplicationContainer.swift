//
//  ApplicationContainer.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation

class ApplicationContainer {
    
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
    
}
