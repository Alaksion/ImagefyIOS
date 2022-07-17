//
//  HomeView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/07/22.
//

import Foundation
import UIKit

class HomeView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    private func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .white
        Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [PhotosTable])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var PhotosTable: UITableView = {
        let view = UITableView()
        return view
    }()
    
}
