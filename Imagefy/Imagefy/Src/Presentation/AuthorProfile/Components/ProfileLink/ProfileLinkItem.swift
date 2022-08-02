//
//  ProfileLinkItem.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 01/08/22.
//

import Foundation
import UIKit

class ProfileLinkItem: UIView {
    
    var data: UserProfileLink? {
        didSet {
            guard let profileLink = data else { return }
            LinkLabel.text = profileLink.label
            LinkIcon.image = getLinkIcon(from: profileLink.type)
        }
    }
    
    var delegate: ProfileLinkItemDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpViews() {
        self.addSubview(Content)
        Content.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        Content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [LinkIcon, LinkLabel, UIView()])
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var LinkIcon: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        return view
    }()
    
    private lazy var LinkLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 14)
        return view
    }()
    
    private func getLinkIcon(from type: UserProfileLinkType) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 20))
        
        switch type {
        case .instagram:
            return UIImage(systemName: "camera", withConfiguration: configuration)
        case .twitter:
            return UIImage(systemName: "pencil", withConfiguration: configuration)
        case .other:
            return UIImage(systemName: "link", withConfiguration: configuration)
        }
    }

}
