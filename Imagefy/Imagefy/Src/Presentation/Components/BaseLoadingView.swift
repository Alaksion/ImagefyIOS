//
//  BaseLoadingView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 06/10/22.
//

import Foundation
import UIKit

final class BaseLoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [loader])
        view.axis = .vertical
        return view
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.startAnimating()
        return view
    }()
    
}

private extension BaseLoadingView {
    
    func setUpViews() {
        addSubview(content)
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        ])
        content.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
