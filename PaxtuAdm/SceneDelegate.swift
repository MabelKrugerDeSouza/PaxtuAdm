//
//  SceneDelegate.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(presenter: presenter)
        let view = LoginViewController(interactor: interactor)
        presenter.view = view
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}

