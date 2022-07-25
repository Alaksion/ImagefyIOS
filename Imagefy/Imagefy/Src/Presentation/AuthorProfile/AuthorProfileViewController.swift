//
//  AuthorProfileViewController.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

class AuthorProfileViewController : UIViewController {
    
    private let contentView = AuthorProfileView()
    
    override func viewDidLoad() {
        self.view = contentView
    }
    
}
