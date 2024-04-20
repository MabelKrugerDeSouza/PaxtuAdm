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
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func loadHome(){}
    func loadForgotPassword(){}
}
