//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class HomeViewController: UIViewController, SkeletonLoadable {
        
    private let homeViewModel: HomeViewModel
    private let coordinator: CoordinatorProtocol
    
    init(viewModel: HomeViewModel, navigator: CoordinatorProtocol) {
        self.homeViewModel = viewModel
        self.coordinator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        homeViewModel.delegate = self
        homeViewModel.getPhotos()
    }
    
    private func setUpViews() {
        self.view = homeView
        self.homeView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    func onProfileHeaderClicked(withUsername username: String) {
        coordinator.goToAuthor(withName: username)
    }
    
    func onReachEndOfList() {
        self.homeViewModel.getPhotos()
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
 
    func onResponse(photos: [FeedPhoto]) {
        DispatchQueue.main.async {
            self.homeView.updatePhotos(newPhotos: photos)
        }
    }
    
    func onError(error: RequestError) {
        print(error)
    }
    
}
