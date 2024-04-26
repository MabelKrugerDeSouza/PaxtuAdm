//
//  LoginInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func loadView()
    func loadHome()
    func loadForgotPassword()
}

final class LoginInteractor: LoginInteractorProtocol {
    
    private let presenter: LoginPresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: LoginPresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func loadHome(){
        coordinator.goToHome()
    }
    func loadForgotPassword(){}
}
