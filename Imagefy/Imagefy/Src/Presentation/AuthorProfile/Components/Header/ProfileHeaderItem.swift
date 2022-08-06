//
//  ProfileHeaderItem.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 29/07/22.
//

import Foundation
import UIKit

struct ProfileHeaderItemData {
    let label: String
    let value: String
}

class ProfileHeaderItem : UIView {
    
    var data: ProfileHeaderItemData? {
        didSet {
            guard let itemDate = data else { return }
            Label.text = itemDate.label
            Value.text = itemDate.value
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpViews() {
        self.addSubview(Content)
        Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        Content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Value, Label])
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    private lazy var Value: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var Label: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .center
        return view
    }()
    
}
