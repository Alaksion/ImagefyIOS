//
//  AuthorProfileViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileViewController : UIViewController, AuthorProfileVmDelegate, ProfileLinkItemDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellMargins: CGFloat = 2
    private var totalCellOffset: CGFloat {
        cellMargins * 3
    }
    
    private let authorViewModel: AuthorProfileViewModel
    private let authorUserName: String
    private let contentView = AuthorProfileView()
    
    init(model: AuthorProfileViewModel, authorName: String) {
        self.authorViewModel = model
        self.authorUserName = authorName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = contentView
        
        authorViewModel.delegate = self
        authorViewModel.getAuthorProfile(with: authorUserName)
        authorViewModel.getAuthorPhotos(with: authorUserName)
        
        contentView.AuthorPhotos.delegate = self
        contentView.AuthorPhotos.dataSource = self
    }
    
}

extension AuthorProfileViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return authorViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AuthorPhotoCell.cellId,
            for: indexPath
        ) as! AuthorPhotoCell
        
        cell.authorPhoto = authorViewModel.photos[indexPath.item]
        
        if indexPath.item == (authorViewModel.photos.count - 1) {
            authorViewModel.getAuthorPhotos(with: self.authorUserName)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedWidth = (collectionView.frame.size.width - self.totalCellOffset) / 3
        let height = estimatedWidth
        return CGSize(width: estimatedWidth, height: height)
    }
    
    // Spacing between rows of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.cellMargins
    }
    
    // Spacing between items of a row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.cellMargins
    }
}

extension AuthorProfileViewController {
    
    func onAuthorProfileError(error: RequestError) {
        debugPrint(error)
    }
    
    func onAuthorProfileResponse(data: UserProfile) {
        DispatchQueue.main.async {
            self.contentView.data = data
        }
    }
    
    func openUrl(destination: String) {
        print(destination)
    }
    
    func onAuthorPhotosResponse() {
        DispatchQueue.main.async {
            self.contentView.AuthorPhotos.reloadData()
            debugPrint("Photos loaded, now there are \(self.authorViewModel.photos.count) photos")
        }
    }
    
}
