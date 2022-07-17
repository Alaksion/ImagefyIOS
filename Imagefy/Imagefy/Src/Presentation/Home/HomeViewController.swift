//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let viewModel = HomeViewModel(
        ImagefyRepository(
            ImagefyRemoteDataSource()
        )
    )
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        self.view = homeView
        homeView.PhotosTable.delegate = self
        homeView.PhotosTable.dataSource = self
        homeView.PhotosTable.register(PhotoCell.self, forCellReuseIdentifier: "photoCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
//        return UITableView.automaticDimension
    }
    
}
