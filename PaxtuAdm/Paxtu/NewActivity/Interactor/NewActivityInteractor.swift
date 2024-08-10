//
//  NewActivityInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import Foundation

protocol NewActivityInteractorProtocol: AnyObject {
    func loadView()
    func dismissScreen()
}

final class NewActivityInteractor: NewActivityInteractorProtocol {
    private let presenter: NewActivityPresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: NewActivityPresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func dismissScreen() {
        coordinator.dismissScreen()
    }
}
