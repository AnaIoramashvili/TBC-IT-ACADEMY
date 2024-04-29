//
//  SceneDelegate.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
 
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        if KeychainService.retrieve(forKey: "username") != nil,
           KeychainService.retrieve(forKey: "password") != nil {
            let countriesVC = MainViewController()
            let navigationController = UINavigationController(rootViewController: countriesVC)
            window?.rootViewController = navigationController
        } else {
            let loginVC = LogInViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
    }
}
