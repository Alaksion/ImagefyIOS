//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit
import Caravel

class HomeViewController: UIViewController {
        
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
    
    private lazy var homeView = HomeView()
    
    private lazy var loadingView = HomeLoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateState(newState: .loading)
        homeViewModel.delegate = self
        homeViewModel.getPhotos()
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

extension HomeViewController {
    
    private func updateState(newState: HomeViewState) {
        switch newState {
        case .loading:
            self.view = loadingView
        case .ready:
            self.view = homeView
            self.homeView.delegate = self
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func onProfileHeaderClicked(withUsername username: String) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: username,
            style: .plain,
            target: self,
            action: nil
        )
        coordinator.goToAuthor(withName: username)
    }
    
    func onReachEndOfList() {
        self.homeViewModel.getPhotos()
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    
    func showNewState(newState: HomeViewState) {
        DispatchQueue.main.async {
            self.updateState(newState: newState)
        }
    }
 
    func onResponse(photos: [FeedPhoto]) {
        DispatchQueue.main.async {
            self.homeView.updatePhotos(newPhotos: photos)
        }
    }
    
    func onError(error: RequestError) {
        print(error)
    }
    
}
