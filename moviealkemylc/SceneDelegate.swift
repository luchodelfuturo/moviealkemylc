//
//  SceneDelegate.swift
//  moviealkemylc
//
//  Created by Luciano Federico Castro on 21/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let homeViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}




    
    

