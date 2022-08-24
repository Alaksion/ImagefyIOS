//
//  PostDetailsInfoCard.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 24/08/22.
//

import Foundation
import UIKit

struct PostDetailsInfoCardData {
    let icon: String
    let value: String
}

final class PostDetailsInfoCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var data: PostDetailsInfoCardData? {
        didSet {
            guard let detailsData = data else { return }
            setUpIcon(iconName: detailsData.icon)
            Value.text = detailsData.value
        }
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Icon, Value])
        view.axis = .horizontal
        view.spacing = 5
        view.alignment = .center
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return view
    }()
    
    private lazy var Icon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var Value: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textColor = .white
        return view
    }()
    
}

private extension PostDetailsInfoCard {
    
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
    
    private func setUpIcon(iconName: String) {
        let imageConfig = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 18))
        let image = UIImage(systemName: iconName, withConfiguration: imageConfig)
        Icon.image = image
        Icon.tintColor = .white
    }
}
