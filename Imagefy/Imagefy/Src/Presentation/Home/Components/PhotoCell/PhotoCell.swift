//
//  PhotoCell.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/07/22.
//

import Foundation
import UIKit

final class PhotoCell: UITableViewCell {
    
    var delegate: PhotoCellDelegate?
    
    var data: FeedPhoto? {
        didSet {
            guard let photoData = data else { return }
            Photo.loadImage(from: photoData.urls.regular)
            
            Header.data = PhotoCellHeaderData(
                name: photoData.authorName,
                userName: photoData.authorUsername,
                profileImageUrl: photoData.autorProfilePic
            )
            Footer.data = PhotoCellFooterData(
                likesCount: photoData.likes,
                authorName: photoData.authorName
            )
        }
    }
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        Photo.cancelLoading()
        Header.cancelImageloading()
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Header, Photo, Footer])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var Header = PhotoCellHeader()
    
    private lazy var Photo: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var Footer = PhotoCellFooter()
}

extension PhotoCell: PhotoCellHeaderDelegate {
    
    func onClickProfileImage(withUsername username: String) {
        delegate?.photoCell(clickedUsername: username)
    }
    
    private func setUpViews() {
        contentView.addSubview(Content)
        Content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        Header.delegate = self
    }
}
