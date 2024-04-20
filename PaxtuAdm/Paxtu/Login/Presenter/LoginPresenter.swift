//
//  LoginPresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

protocol LoginPresenterProtocol: AnyObject {
    func presentView()
}

final class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewController?
    
    func presentView() {
        view?.showView(
            with: LoginModel(
                backgroundImage: UIImage.backgroundImage,
                titleLogo:  UIImage.titleImage,
            title: "login".uppercased(),
            description: "Digite o número do seu registro da carteirinha e sua senha.",
            titlePrimaryTextField: "Usuário",
            titleSecondaryTextField: "Senha",
            titleFirstButton: "Entrar",
            titleSecondButton: "Esqueci minha senha"
            )
        )
    }
}
