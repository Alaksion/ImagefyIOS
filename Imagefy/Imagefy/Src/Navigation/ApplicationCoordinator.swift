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
    func goToAuthor(withName name: String)
    func goToPost(withId id: String)
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
        startDestination()
    }
    
    func startDestination() {
        let destination = HomeViewController(
            viewModel: container.injectHomeViewModel(),
            navigator: self
        )
        controller.pushViewController(destination, animated: true)
    }
    
    func goToAuthor(withName name: String) {
        controller.pushViewController(
            AuthorProfileViewController(
                model: container.injectAuthorViewModel(),
                authorName: name,
                navigator: self
            ),
            animated: true
        )
    }
    
    func goToPost(withId id: String) {
        let destination = PostDetailsViewController(
            viewModel: container.injectPostDetailsVm(
                postId: id
            )
        )
        controller.pushViewController(destination, animated: true)
    }
    
}
