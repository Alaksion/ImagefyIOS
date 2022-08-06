//
//  ProfileUserInfo.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 06/08/22.
//

import Foundation
import UIKit

struct ProfileUserInfoData {
    let authorName: String
    let authorBio: String
}

final class ProfileUserInfo: UIView {
    
    var data: ProfileUserInfoData? {
        didSet {
            guard let userInfo = data else { return }
            AuthorName.text = userInfo.authorName
            AuthorBio.text = userInfo.authorBio
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
        let view = UIStackView(arrangedSubviews: [AuthorName, AuthorBio])
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.axis = .vertical
        view.spacing = 10
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
    
}

extension ProfileUserInfo {
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
