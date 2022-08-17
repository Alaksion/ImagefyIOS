//
//  PostDetailsViewModel.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/08/22.
//

import Foundation

final class PostDetailsViewModel {
    
    private let repository: ImagefyRepositoryProtocol
    private let postId: String
    
    var delegate: PostDetailsVmDelegate?
    
    init(_ repository: ImagefyRepositoryProtocol, forPostWithId postId: String) {
        self.repository = repository
        self.postId = postId
    }
    
    func getPostDetails() {
        Task {
            let response = await repository.getPhotoDetails(withId: postId)
            switch response {
            case .success(let data):
                delegate?.onSuccess(data: data)
            case .failure(let error):
                delegate?.onError(error: error)
            }
        }
    }
    
}
