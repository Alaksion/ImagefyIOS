//
//  PostDetailsView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/08/22.
//

import Foundation
import UIKit

final class PostDetailsView: UIView {
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [PostPhoto])
        view.axis = .vertical
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
        NSLayoutConstraint.activate([
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
