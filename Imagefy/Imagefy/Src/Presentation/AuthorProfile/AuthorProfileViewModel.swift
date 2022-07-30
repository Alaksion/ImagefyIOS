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
    
}
