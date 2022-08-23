//
//  AuthorProfileViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation

final class AuthorProfileViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    
    init(repository: ImagefyRepositoryProtocol) {
        self.repository = repository
    }
    
    var delegate: AuthorProfileVmDelegate?
    
    var photos: [UserProfilePhoto] = []
    private var page = 1
    
    private var isPaginationEnded = false
    
    private var isPhotosLoading = false
    
    func getAuthorProfile(with username: String) {
        Task {
            let response = await repository.getUserProfile(username: username)
            switch response {
            case .success(let data):
                delegate?.onAuthorProfileResponse(data: data)
            case.failure(let error):
                delegate?.onAuthorProfileError(error: error)
            }
        }
    }
    
    func getAuthorPhotos(
        with username: String
    ) {
        Task {
            if(!isPaginationEnded && !isPhotosLoading) {
                isPhotosLoading = true
                let response = await repository.getUserPhotos(username: username, page: self.page)
                switch response {
                case .success(let data):
                    onProfilePhotosResponse(with: data)
                case .failure (let error):
                    debugPrint(error)
                    isPhotosLoading = false
                }
            }
        }
    }
    
    private func onProfilePhotosResponse(with data: [UserProfilePhoto]) {
        if data.isEmpty {
            isPaginationEnded = true
            return
        }
        
        photos.append(contentsOf: data)
        delegate?.onAuthorPhotosResponse(data: self.photos)
        isPhotosLoading = false
        page += 1
    }
    
}
