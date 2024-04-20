//
//  LoginViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
    func showView(with model: LoginModel)
}

final class LoginViewController: UIViewController {
    
    private let interactor: LoginInteractorProtocol
    
    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: LoginView {
        return super.view as! LoginView
    }
    
    override func loadView() {
        super.loadView()
        let theView = LoginView()
        
        theView.onLoginButtonAction = { [weak self] in
            self?.interactor.loadHome()
        }
        
        theView.onForgotPasswordButtonAction = { [weak self] in
            self?.interactor.loadForgotPassword()
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadView()
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func showView(with model: LoginModel) {
        theView.setupData(with: model)
    }
}
