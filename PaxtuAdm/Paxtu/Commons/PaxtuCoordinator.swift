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
    func goToNewActivity()
    func goToEvents()
    func goToSession()
    func goToAssociates()
    func goToActivities()
    func goToLibrary()
    func goToSchoolCamp()
}

final class PaxtuCoordinator: PaxtuCoordinatorProtocol {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LaunchScreenViewController(coordinator: self)
        
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
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, coordinator: self)
        let controller = HomeViewController(interactor: interactor)
        
        presenter.view = controller
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func goToNewActivity() {
        print("foi")
    }
    
    func goToEvents() {
        print("foi")
    }
    
    func goToSession() {
        print("foi")
    }
    
    func goToAssociates() {
        print("foi")
    }
    
    func goToActivities() {
        print("foi")
    }
    
    func goToLibrary() {
        print("foi")
    }
    
    func goToSchoolCamp() {
        print("foi")
    }
}
