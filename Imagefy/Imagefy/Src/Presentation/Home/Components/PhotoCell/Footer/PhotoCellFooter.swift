//
//  PhotoCellFoter.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 08/08/22.
//

import Foundation
import UIKit

struct PhotoCellFooterData {
    let likesCount: Int
    let authorName: String
}

final class PhotoCellFooter: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var data: PhotoCellFooterData? {
        didSet {
            guard let footerData = data else { return }
            LikesAmount.text = String(footerData.likesCount)
            Credits.attributedText = setCreditsText(authorName: footerData.authorName)
        }
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [LikesRow, Credits])
        view.axis = .vertical
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.spacing = 5
        return view
    }()
    
    private lazy var LikesRow: UIStackView = {
        let view = UIStackView(arrangedSubviews: [LikeIcon, LikesAmount, UIView()])
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 5
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
        return view
    }()
    
    private lazy var Credits: UILabel = {
        let view = UILabel()
        return view
    }()
    
}

extension PhotoCellFooter {
    
    private func setUpViews() {
        addSubview(Content)
        NSLayoutConstraint.activate([
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setCreditsText(authorName: String) -> NSAttributedString {
        let viewText = NSMutableAttributedString("")
        let authorNameAttr = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        let authorName = NSAttributedString(string: " \(authorName) ", attributes: authorNameAttr)
        
        viewText.append(NSAttributedString(string: "Photo by"))
        viewText.append(authorName)
        viewText.append(NSAttributedString("on Unsplash"))
        
        return viewText
    }
    
}
