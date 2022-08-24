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
    
    private var photos: [FeedPhoto] = []
    
    var delegate: HomeViewDelegate?
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [PhotosTable])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var PhotosTable: UITableView = {
        let view = UITableView()
        view.register(PhotoCell.self, forCellReuseIdentifier: PhotoCell.Id)
        return view
    }()
    
}

extension HomeView {
    private func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .white
        Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        PhotosTable.delegate = self
        PhotosTable.dataSource = self
    }
    
    func updatePhotos(newPhotos: [FeedPhoto]) {
        self.photos = newPhotos
        self.PhotosTable.reloadData()
    }
}

extension HomeView: PhotoCellDelegate {
    
    func photoCell(clickedUsername: String) {
        delegate?.onProfileHeaderClicked(withUsername: clickedUsername)
    }
    
}

extension HomeView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.Id, for: indexPath) as! PhotoCell
        let data = photos[indexPath.section]
        cell.data = data
        cell.delegate = self
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == photos.count - 1 {
            delegate?.onReachEndOfList()
        }
    }
    
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = self.bounds.height
        return screenHeight * 0.6
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
