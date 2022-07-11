//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let repository = ImagefyRepository(
        ImagefyRemoteDataSource()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        Task(priority: .background) {
            let result = await repository.getFeedPhotos(page: 1)
            
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }


}

