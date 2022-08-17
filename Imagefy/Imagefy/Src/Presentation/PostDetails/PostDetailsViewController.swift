//
//  PostDetailsViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/08/22.
//

import Foundation
import UIKit

final class PostDetailsViewController: UIViewController {
    
    private let postViewModel: PostDetailsViewModel
    
    init(viewModel: PostDetailsViewModel) {
        self.postViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentView: PostDetailsView = {
        let view = PostDetailsView()
        return view
    }()
    
    override func viewDidLoad() {
        self.view = contentView
        postViewModel.getPostDetails()
        postViewModel.delegate = self
    }
    
}

extension PostDetailsViewController : PostDetailsVmDelegate {
    func onSuccess(data: PhotoDetails) {
        DispatchQueue.main.async {
            debugPrint(data)
        }
    }
    
    func onError(error: RequestError) {
        DispatchQueue.main.async {
            debugPrint(error)
        }
    }
    
}
