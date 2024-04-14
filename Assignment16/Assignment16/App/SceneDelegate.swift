//
//  SceneDelegate.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = UINavigationController(rootViewController: OnBoardingViewController())
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
}
