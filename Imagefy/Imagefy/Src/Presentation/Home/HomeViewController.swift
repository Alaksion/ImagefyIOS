//
//  ViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = HomeViewModel(
        ImagefyRepository(
            ImagefyRemoteDataSource()
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        // use [weak self] to avoid retain cycles if the VM is called again inside the closure.
        viewModel.getPhotos { photos  in
            
        } onError: { err in
            print(err)
        }
    }
    
}
