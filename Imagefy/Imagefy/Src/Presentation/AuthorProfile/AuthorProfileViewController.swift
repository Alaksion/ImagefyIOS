//
//  AuthorProfileViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileViewController : UIViewController, AuthorProfileVmDelegate {
    
    private let authorViewModel: AuthorProfileViewModel
    private let authorUserName: String
    private let contentView = AuthorProfileView()
    
    init(model: AuthorProfileViewModel, authorName: String) {
        self.authorViewModel = model
        self.authorUserName = authorName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = contentView
        authorViewModel.delegate = self
        authorViewModel.getAuthorProfile(with: authorUserName)
    }
    
}

extension AuthorProfileViewController {
    
    func onAuthorProfileError(error: RequestError) {
        debugPrint(error)
    }
    
    func onAuthorProfileResponse(data: UserProfile) {
        DispatchQueue.main.async {
            self.contentView.data = data
        }
    }
    
}
