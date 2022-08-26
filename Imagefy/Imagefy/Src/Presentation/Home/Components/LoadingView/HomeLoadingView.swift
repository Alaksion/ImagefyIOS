//
//  HomeLoadingView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 26/08/22.
//

import Foundation
import UIKit

final class HomeLoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [loader])
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.startAnimating()
        return view
    }()
    
    private lazy var Teste: UILabel = {
        let view = UILabel()
        view.text = "hello"
        return view
    }()
    
}

private extension HomeLoadingView {
    func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            Content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Content.topAnchor.constraint(equalTo: self.topAnchor),
            Content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
}
