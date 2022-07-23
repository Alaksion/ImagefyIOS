//
//  PhotoCell.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/07/22.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
    
    var data: FeedPhoto? {
        didSet {
            guard let photoData = data else { return }
            Name.text = photoData.authorName
            Username.text = photoData.authorUsername
            LikesAmount.text = String(photoData.likes)
            setCreditsText(authorName: photoData.authorName)
            Photo.loadImage(from: photoData.urls.regular)
            ProfileImage.loadImage(from: photoData.autorProfilePic)
        }
    }
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        Photo.cancelLoading()
        ProfileImage.cancelLoading()
    }
    
    private func setUpViews() {
        contentView.addSubview(Content)
        Content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Header, Photo, LikesRow, CreditsBox])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var Header: UIStackView = {
        let view = UIStackView(arrangedSubviews: [ProfileImage, Names])
        view.axis = .horizontal
        view.spacing = 10
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.alignment = .center
        return view
    }()
    
    private lazy var ProfileImage: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.backgroundColor = .orange
        view.contentMode = .scaleAspectFill
        
        // Aplica o corner radius a todos os layers dessa view, dessa forma fica redondo depois de setar a imagem
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
    
    private lazy var Photo: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var LikesRow: UIStackView = {
        // View aqui é gambiarra pra ocupar o espaço restante
        let view = UIStackView(arrangedSubviews: [LikeIcon, LikesAmount, UIView()])
        view.axis = .horizontal
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var LikeIcon : UIButton = {
        let view = UIButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 20))
        // Usando e configurando o display de um SF Icon
        let image = UIImage(systemName: "heart", withConfiguration: configuration)
        view.imageView?.tintColor = .black
        view.setImage(image, for: .normal)
        return view
    }()
    
    private lazy var LikesAmount: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        return view
    }()
    
    private lazy var CreditsBox : UIStackView = {
        let view = UIStackView(arrangedSubviews: [Credits])
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return view
    }()
    
    private lazy var Credits: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private func setCreditsText(authorName: String) {
        let viewText = NSMutableAttributedString("")
        let authorNameAttr = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        let authorName = NSAttributedString(string: " \(authorName) ", attributes: authorNameAttr)
        
        viewText.append(NSAttributedString(string: "Photo by"))
        viewText.append(authorName)
        viewText.append(NSAttributedString("on Unsplash"))
        
        Credits.attributedText = viewText
    }
    
}
