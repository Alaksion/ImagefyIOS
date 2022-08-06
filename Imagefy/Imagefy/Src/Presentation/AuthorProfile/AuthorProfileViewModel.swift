//
//  AuthorProfileViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation

class AuthorProfileViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    
    init(repository: ImagefyRepositoryProtocol) {
        self.repository = repository
    }
    
    var delegate: AuthorProfileVmDelegate?
    
    var photos: [UserProfilePhoto] = []
    private var page = 1
    
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
            let response = await repository.getUserPhotos(username: username, page: self.page)
            switch response {
            case .success(let data):
                photos.append(contentsOf: data)
                delegate?.onAuthorPhotosResponse()
            case .failure (let error):
                debugPrint(error)
            }
        }
    }
    
}
