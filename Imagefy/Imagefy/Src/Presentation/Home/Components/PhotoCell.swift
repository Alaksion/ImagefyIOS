//
//  PhotoCell.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/07/22.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    private func setUpViews() {
        contentView.addSubview(Content)
        Content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Header, Photo, LikesRow])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var Header: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Image, Names])
        view.axis = .horizontal
        view.spacing = 10
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.alignment = .center
        return view
    }()
    
    private lazy var Image: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var Names: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Nickname, Username])
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    private lazy var Nickname: UILabel = {
        let view = UILabel()
        view.text = "KeilaHoetzel"
        view.font = UIFont.boldSystemFont(ofSize: 16)
        return view
    }()
    
    private lazy var Username: UILabel = {
        let view = UILabel()
        view.text = "Keila Hoetzel"
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    private lazy var Photo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var LikesRow: UIStackView = {
        let view = UIStackView(arrangedSubviews: [LikeIcon, LikesAmount])
        view.axis = .horizontal
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.alignment = .leading
        return view
    }()
    
    private lazy var LikeIcon : UIButton = {
        let view = UIButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 20))
        let image = UIImage(systemName: "heart", withConfiguration: configuration)
        view.imageView?.tintColor = .black
        view.setImage(image, for: .normal)
        return view
    }()
    
    private lazy var LikesAmount: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.text = "15000 likes"
        return view
    }()
    
}
