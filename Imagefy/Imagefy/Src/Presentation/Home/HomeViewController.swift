//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeViewModelDelegate {
    
    func onResponse() {
        DispatchQueue.main.async {
            self.homeView.PhotosTable.reloadData()
        }
    }
    
    func onError(error: RequestError) {
        print(error)
    }
    
    private let viewModel = HomeViewModel(
        ImagefyRepository(
            ImagefyRemoteDataSource()
        )
    )
    
    private let homeView = HomeView()
    private let imageloader = DefaultImageLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        viewModel.delegate = self
        viewModel.getPhotos()
    }
    
    private func setUpViews() {
        self.view = homeView
        homeView.PhotosTable.delegate = self
        homeView.PhotosTable.dataSource = self
        homeView.PhotosTable.register(PhotoCell.self, forCellReuseIdentifier: "photoCell")
    }
    
}

extension HomeViewController {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        // #1 Cria uma seção para cada item
        return viewModel.photos.count
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
        let data = viewModel.photos[indexPath.section]
        cell.data = data
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Configurando o tamanho das table cells para ocuparem 60% do tamanho da view desse view controller
        let screenHeight = self.view.bounds.height
        return screenHeight * 0.6
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Notifica o ViewModel para chamar a próxima página quando chegar no penúltimo cell
        if indexPath.row == viewModel.photos.count - 1 {
            viewModel.getPhotos()
        }
    }
    
}
