//
//  AuthorProfileView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .white
        Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private lazy var Content: UIStackView = {
        let view = UIStackView()
        return view
    }()
    
}
