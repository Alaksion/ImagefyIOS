//
//  ApplicationCoordinator.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 25/07/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    func start()
    func goToAuthor()
}

final class ApplicationCoordinator: CoordinatorProtocol {
    private let container = ApplicationContainer.instance
    
    private let controller: UINavigationController
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
        controller = UINavigationController()
    }
    
    func start() {
        window.rootViewController = controller
        window.makeKeyAndVisible()
        let startDestination = HomeViewController()
        startDestination.coordinator = self
        controller.pushViewController(
            startDestination,
            animated: true
        )
    }
    
    func goToAuthor() {
        controller.pushViewController(AuthorProfileViewController(), animated: true)
    }
    
}
