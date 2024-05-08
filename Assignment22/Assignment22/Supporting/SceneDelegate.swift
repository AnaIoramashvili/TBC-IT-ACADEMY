//
//  SceneDelegate.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let mainPageViewController = MainPageViewController()
        let navigationController = UINavigationController(rootViewController: mainPageViewController)
        
        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}
