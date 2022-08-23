//
//  AuthorProfileViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileViewController : UIViewController {
    
    private let authorViewModel: AuthorProfileViewModel
    private let authorUserName: String
    private let contentView = AuthorProfileView()
    private let navigator: ApplicationCoordinator
    
    init(model: AuthorProfileViewModel, authorName: String, navigator: ApplicationCoordinator) {
        self.authorViewModel = model
        self.authorUserName = authorName
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = contentView
        self.contentView.delegate = self
        authorViewModel.delegate = self
        authorViewModel.getAuthorProfile(with: authorUserName)
        authorViewModel.getAuthorPhotos(with: authorUserName)
    }
    
}

extension AuthorProfileViewController : AuthorProfileVmDelegate{
    
    func onAuthorProfileError(error: RequestError) {
        debugPrint(error)
    }
    
    func onAuthorProfileResponse(data: UserProfile) {
        DispatchQueue.main.async {
            self.contentView.data = data
        }
    }
    
    func onAuthorPhotosResponse(data: [UserProfilePhoto]) {
        DispatchQueue.main.async {
            self.contentView.updatePhotos(newPhotos: data)
        }
    }
    
}

extension AuthorProfileViewController : AuthorProfileViewDelegate {
    
    func loadMorePhotos() {
        self.authorViewModel.getAuthorPhotos(with: self.authorUserName)
    }
    
    func onPhotoCellClick(withId id: String) {
        self.navigator.goToPost(withId: id)
    }
}
