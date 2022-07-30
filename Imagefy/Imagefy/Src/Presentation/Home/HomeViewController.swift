//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeViewModelDelegate, PhotoCellDelegate {
        
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
        homeView.PhotosTable.delegate = self
        homeView.PhotosTable.dataSource = self
        homeView.PhotosTable.register(PhotoCell.self, forCellReuseIdentifier: "photoCell")
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
 
    func numberOfSections(in tableView: UITableView) -> Int {
        // #1 Cria uma seção para cada item
        return homeViewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #2 Coloca somente um item por seção
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // #3 Configura o header da seção pra ter tamanho 10
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Deixa o header invisível, combinado com os passos #1, #2 e #3 cria um espaçamento entre os table cells
        // Parece meio macarrônico mas funciona.
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let data = homeViewModel.photos[indexPath.section]
        cell.data = data
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Configurando o tamanho das table cells para ocuparem 60% do tamanho da view desse view controller
        let screenHeight = self.view.bounds.height
        return screenHeight * 0.6
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Notifica o ViewModel para chamar a próxima página quando chegar no penúltimo cell
        if indexPath.row == homeViewModel.photos.count - 1 {
            homeViewModel.getPhotos()
        }
    }
    
    func onResponse() {
        DispatchQueue.main.async {
            self.homeView.PhotosTable.reloadData()
        }
    }
    
    func onError(error: RequestError) {
        print(error)
    }
    
    func photoCell(clickedUsername: String) {
        coordinator.goToAuthor(withName: clickedUsername)
    }
    
}
