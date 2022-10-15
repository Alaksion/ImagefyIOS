//
//  AuthorProfileViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit
import Caravel

class AuthorProfileViewController : UIViewController {
    
    private let authorViewModel: AuthorProfileViewModel
    private let authorUserName: String
    private let navigator: ApplicationCoordinator
    
    private lazy var contentView = AuthorProfileView()
    private lazy var loadingView = BaseLoadingView()
    
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
        
        self.authorViewModel.delegate = self
        self.contentView.delegate = self
        
        self.setUpNavBar()
        
        authorViewModel.getAuthorProfile(with: authorUserName)
        authorViewModel.getAuthorPhotos(with: authorUserName)
    }
}

private extension AuthorProfileViewController {
    
    private func setUpNavBar() {
        guard let navBar = self.navigationController?.navigationBar else { return }
        let arrowLeft = UIImage(systemName: "arrow.left")
        
        navBar.backIndicatorImage = arrowLeft
        navBar.backIndicatorTransitionMaskImage = arrowLeft
        navBar.tintColor = .black
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
