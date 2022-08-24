//
//  PostDetailsInfoRow.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/08/22.
//

import Foundation
import UIKit

struct PostDetailsData {
    let likeCount: Int
    let downloadCount: Int
}

final class PostDetailsRow : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    var data: PostDetailsData? {
        didSet {
            guard let detailsData = data else { return }
            LikesCard.data = PostDetailsInfoCardData(
                icon: "heart",
                value: String(detailsData.likeCount)
            )
            DownloadCard.data = PostDetailsInfoCardData(
                icon: "square.and.arrow.down",
                value: String(detailsData.downloadCount)
            )
            
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [UIView(), LikesCard, DownloadCard, UIView()])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var LikesCard: PostDetailsInfoCard = {
        let view = PostDetailsInfoCard()
        return view
    }()
    
    private lazy var DownloadCard: PostDetailsInfoCard = {
        let view = PostDetailsInfoCard()
        return view
    }()
    
}

extension PostDetailsRow {
    private func setUpViews() {
        self.addSubview(Content)
        NSLayoutConstraint.activate([
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        Content.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
