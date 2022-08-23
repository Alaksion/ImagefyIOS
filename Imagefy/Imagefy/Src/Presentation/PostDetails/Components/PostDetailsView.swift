//
//  PostDetailsView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/08/22.
//

import Foundation
import UIKit

final class PostDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var data: PhotoDetails? {
        didSet {
            guard let photoDetails = data else { return }
            PostPhoto.loadImage(from: photoDetails.links.regular)
        }
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [PostPhoto])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var PostPhoto: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
}

extension PostDetailsView {
    func setUpView() {
        self.addSubview(Content)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
