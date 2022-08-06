//
//  UserProfileHeader.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 06/08/22.
//

import Foundation
import UIKit

struct UserProfileHeaderData {
    let profileImageUrl: String
    let postsCount: Int
    let followerCount: Int
    let followingCount: Int
}

final class UserProfileHeader: UIView {
    
    var data: UserProfileHeaderData? {
        didSet {
            guard let headerData = data else { return }
            UserProfilePicture.loadImage(from: headerData.profileImageUrl)
            FollowersCount.data = ProfileHeaderItemData(label: "Followers", value: String(headerData.followerCount))
            FollowingCount.data = ProfileHeaderItemData(label: "Following", value: String(headerData.followingCount))
            PostsCount.data = ProfileHeaderItemData(label: "Posts", value: String(headerData.postsCount))
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
        let view = UIStackView(arrangedSubviews: [UserProfilePicture, PostsCount, FollowersCount, FollowingCount])
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return view
    }()
    
    private lazy var UserProfilePicture: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.layer.cornerRadius = 50
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var PostsCount = ProfileHeaderItem()
    private lazy var FollowersCount = ProfileHeaderItem()
    private lazy var FollowingCount = ProfileHeaderItem()
    
}

extension UserProfileHeader {
    private func setUpViews() {
        self.addSubview(Content)
        NSLayoutConstraint.activate(
            [
                Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                Content.topAnchor.constraint(equalTo: self.topAnchor),
                Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
}
