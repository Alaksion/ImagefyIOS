//
//  AuthorProfileView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

final class AuthorProfileView: UIView {
    
    var data: UserProfile? {
        didSet {
            guard let profileData = data else { return }
            Header.data = UserProfileHeaderData(
                profileImageUrl: profileData.profileImageUrl,
                postsCount: profileData.postsCount,
                followerCount: profileData.followersCount,
                followingCount: profileData.followingCount
            )
            
            Info.data = ProfileUserInfoData(
                authorName: profileData.name,
                authorBio: profileData.bio
            )
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Header, Info, AuthorPhotos])
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    private lazy var Header = UserProfileHeader()
    private lazy var Info = ProfileUserInfo()
    
    lazy var AuthorPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        view.register(AuthorPhotoCell.self, forCellWithReuseIdentifier: AuthorPhotoCell.cellId)
        return view
    }()
    
}

extension AuthorProfileView {
    
    private func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .white
        NSLayoutConstraint.activate(
            [
                Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )
        
        Content.translatesAutoresizingMaskIntoConstraints = false
    }

}
