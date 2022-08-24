//
//  PhotoCellHeader.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 08/08/22.
//

import Foundation
import UIKit

struct PhotoCellHeaderData {
    let name: String
    let userName: String
    let profileImageUrl: String
}

final class PhotoCellHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var data: PhotoCellHeaderData? {
        didSet {
            guard let headerData = data else { return }
            Name.text = headerData.name
            Username.text = headerData.userName
            ProfileImage.loadImage(from: headerData.profileImageUrl)
        }
    }
    
    var delegate: PhotoCellHeaderDelegate?
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [ProfileImage, Names])
        view.axis = .horizontal
        view.spacing = 10
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.alignment = .center
        return view
    }()
    
    private lazy var ProfileImage: UIImageView = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageClick))
        tapGesture.numberOfTapsRequired = 1
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.gestureRecognizers = [tapGesture]
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var Names: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Name, Username])
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    private lazy var Username: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        return view
    }()
    
    private lazy var Name: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
}
extension PhotoCellHeader {
    
    private func setUpViews() {
        addSubview(Content)
        Content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc
    private func profileImageClick() {
        guard let headerData = data else { return }
        delegate?.onClickProfileImage(withUsername: headerData.userName)
    }
    
    
    func cancelImageloading() {
        ProfileImage.cancelLoading()
    }
}
