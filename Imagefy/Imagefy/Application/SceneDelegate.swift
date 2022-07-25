//
//  SceneDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appCoordinator: CoordinatorProtocol?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let localScene = (scene as? UIWindowScene) else { return }
        
        let uiWindow = UIWindow(windowScene: localScene)
        appCoordinator = ApplicationCoordinator(uiWindow)
        self.window = uiWindow
        appCoordinator?.start()
    }
}

