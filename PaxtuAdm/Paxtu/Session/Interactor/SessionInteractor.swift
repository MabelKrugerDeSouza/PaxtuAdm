//
//  SessionInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 25/08/24.
//

import Foundation

protocol SessionInteractorProtocol: AnyObject {
    func loadView()
    func dismissFlow()
}

final class SessionInteractor: SessionInteractorProtocol {
    private let presenter: SessionPresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: SessionPresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func dismissFlow() {
        coordinator.dismissScreen()
    }
}
