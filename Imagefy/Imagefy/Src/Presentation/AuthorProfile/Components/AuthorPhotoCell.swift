//
//  AuthorPhotoCell.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 06/08/22.
//

import Foundation
import UIKit

final class AuthorPhotoCell: UICollectionViewCell {
    
    static let cellId = "author_photo_cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(Content)
        
        Content.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        Content.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var authorPhoto: UserProfilePhoto? {
        didSet {
            guard let data = authorPhoto else { return }
            Photo.loadImage(from: data.url)
            Photo.backgroundColor = data.color
        }
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Photo])
        return view
    }()
    
    private lazy var Photo: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
}
