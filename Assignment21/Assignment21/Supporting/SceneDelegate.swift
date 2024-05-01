//
//  SceneDelegate.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let catFactViewController = CatFactViewController()
        let navigationController = UINavigationController(rootViewController: catFactViewController)

        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

