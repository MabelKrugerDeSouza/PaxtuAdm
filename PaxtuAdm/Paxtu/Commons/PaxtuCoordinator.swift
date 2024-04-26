//
//  PaxtuCoordinator.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

protocol PaxtuCoordinatorProtocol {
    func start()
    func goToLogin()
    func goToHome()
}

final class PaxtuCoordinator: PaxtuCoordinatorProtocol {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = LauchScreenPresenter()
        let interactor = LauchScreenInteractor(presenter: presenter, coordinator: self)
        let controller = LaunchScreenViewController(interactor: interactor)
        presenter.view = controller
        
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    func goToLogin() {
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(presenter: presenter, coordinator: self)
        let controller = LoginViewController(interactor: interactor)
        presenter.view = controller
        
        self.navigationController?.setViewControllers([controller], animated: true)
    }
    
    func goToHome() {
        let controller = HomeViewController()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
