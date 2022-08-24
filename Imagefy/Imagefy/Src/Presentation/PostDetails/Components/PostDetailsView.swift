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
            InfoRow.data = PostDetailsData(
                likeCount: photoDetails.likes,
                downloadCount: photoDetails.downloads
            )
            self.backgroundColor = photoDetails.color
        }
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [PostPhoto, InfoRow, UIView()])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var PostPhoto: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var InfoRow: PostDetailsRow = {
        let view = PostDetailsRow()
        return view
    }()
    
}

extension PostDetailsView {
    func setUpView() {
        self.addSubview(Content)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
