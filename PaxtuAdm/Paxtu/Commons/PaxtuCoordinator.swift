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
    func dismissScreen()
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
        
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    func goToHome() {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, coordinator: self)
        let controller = HomeViewController(interactor: interactor)
        
        presenter.view = controller
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goToNewActivity() {
        let presenter = NewActivityPresenter()
        let interactor = NewActivityInteractor(presenter: presenter, coordinator: self)
        let controller = NewActivityViewController(interactor: interactor)
        presenter.view = controller
       
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func goToEvents() {
        let presenter = EventsPresenter()
        let interactor = EventsInteractor(presenter: presenter, coordinator: self)
        let controller = EventsViewController(interactor: interactor)
        presenter.view = controller
        
        navigationController?.pushViewController(controller, animated: true)
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
    
    func dismissScreen() {
        navigationController?.popViewController(animated: true)
    }
}
