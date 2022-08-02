//
//  AuthorProfileView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileView: UIView {
    
    var data: UserProfile? {
        didSet {
            guard let profileData = data else { return }
            UserProfilePicture.loadImage(from: profileData.profileImageUrl)
            PostsCount.data = ProfileHeaderItemData(label: "Posts", value: String(profileData.postsCount))
            FollowingCount.data = ProfileHeaderItemData(label: "Following", value: String(profileData.followingCount))
            FollowersCount.data = ProfileHeaderItemData(label: "Followers", value: String(profileData.followersCount))
            AuthorName.text = profileData.name
            AuthorBio.text = profileData.bio
            setProfileLink(link: profileData.instagramLink)
            setProfileLink(link: profileData.twitterLink)
            setProfileLink(link: profileData.portfolioLink)
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
        let view = UIStackView(arrangedSubviews: [Header, AuthorName, AuthorBio, Links, UIView()])
        view.axis = .vertical
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        view.spacing = 5
        view.setCustomSpacing(10, after: AuthorBio)
        return view
    }()
    
    private lazy var Header: UIStackView = {
        let view = UIStackView(arrangedSubviews: [UserProfilePicture, PostsCount, FollowersCount, FollowingCount])
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var UserProfilePicture: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.layer.cornerRadius = 50
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var AuthorName: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return view
    }()
    
    private lazy var AuthorBio: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.numberOfLines = 50
        return view
    }()
    
    private lazy var PostsCount = ProfileHeaderItem()
    private lazy var FollowersCount = ProfileHeaderItem()
    private lazy var FollowingCount = ProfileHeaderItem()
    
    private lazy var Links: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    lazy var InstagramLink = ProfileLinkItem()
    lazy var Twitter = ProfileLinkItem()
    lazy var Portfolio = ProfileLinkItem()
    
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
    
    private func setProfileLink(link: UserProfileLink?) {
        guard let safeLink = link else { return }
        
        switch safeLink.type {
        case .instagram:
            InstagramLink.data = safeLink
            Links.addArrangedSubview(InstagramLink)
        case .twitter:
            Twitter.data = safeLink
            Links.addArrangedSubview(Twitter)
        case .other:
            Portfolio.data = safeLink
            Links.addArrangedSubview(Portfolio)
        }
    }

}
