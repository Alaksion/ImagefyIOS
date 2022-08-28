//
//  AuthorProfileView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

final class AuthorProfileView: UIView {
    
    var data: UserProfile? {
        didSet {
            guard let profileData = data else { return }
            Header.data = UserProfileHeaderData(
                profileImageUrl: profileData.profileImageUrl,
                postsCount: profileData.postsCount,
                followerCount: profileData.followersCount,
                followingCount: profileData.followingCount
            )
            
            Info.data = ProfileUserInfoData(
                authorName: profileData.name,
                authorBio: profileData.bio
            )
        }
    }
    
    var delegate: AuthorProfileViewDelegate?
    
    private var photos: [UserProfilePhoto] = []
    
    private let cellMargins: CGFloat = 2
    private var totalCellOffset: CGFloat {
        cellMargins * 3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var Content: UIStackView = {
        let view = UIStackView(arrangedSubviews: [Header, Info, AuthorPhotos])
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    private lazy var Header = UserProfileHeader()
    private lazy var Info = ProfileUserInfo()
    
    private lazy var AuthorPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        view.register(AuthorPhotoCell.self, forCellWithReuseIdentifier: AuthorPhotoCell.cellId)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
}

private extension AuthorProfileView {
    
    private func setUpViews() {
        self.addSubview(Content)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
                Content.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                Content.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                Content.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                Content.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        Content.translatesAutoresizingMaskIntoConstraints = false
    }

}

extension AuthorProfileView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AuthorPhotoCell.cellId,
            for: indexPath
        ) as! AuthorPhotoCell
        
        cell.authorPhoto = photos[indexPath.item]
        
        if indexPath.item == (photos.count - 1) {
            delegate?.loadMorePhotos()
        }
        
        return cell
    }
    
    func updatePhotos(newPhotos: [UserProfilePhoto]) {
        self.photos = newPhotos
        self.AuthorPhotos.reloadData()
    }
    
}

extension AuthorProfileView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedWidth = (collectionView.frame.size.width - self.totalCellOffset) / 3
        let height = estimatedWidth
        return CGSize(width: estimatedWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.cellMargins
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.cellMargins
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = photos[indexPath.item]
        delegate?.onPhotoCellClick(withId: data.id)
    }
    
}
