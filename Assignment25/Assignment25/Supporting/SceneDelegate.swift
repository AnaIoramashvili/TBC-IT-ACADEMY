//
//  SceneDelegate.swift
//  Assignment25
//
//  Created by Ana on 5/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let viewModel = MainPageViewModel()
        let mainPageViewController = MainPageViewController(viewModel: viewModel)
        
        window.rootViewController = mainPageViewController
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

