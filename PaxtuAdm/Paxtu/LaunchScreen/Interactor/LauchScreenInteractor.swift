//
//  LauchScreenInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import Foundation

protocol LauchScreenInteractorProtocol: AnyObject {
    func loadView()
    func animationComplete()
}

final class LauchScreenInteractor: LauchScreenInteractorProtocol {
    private let presenter: LauchScreenPresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: LauchScreenPresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        self.presenter.presentView()
    }
    
    func animationComplete() {
        coordinator.goToLogin()
    }
}
