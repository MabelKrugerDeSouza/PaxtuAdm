//
//  EventsInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit

protocol EventsInteractorProtocol: AnyObject {
    func loadView()
    func dissmissScreen()
}

final class EventsInteractor: EventsInteractorProtocol {
    private let presenter: EventsPresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: EventsPresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func dissmissScreen() {
        coordinator.dismissScreen()
    }
}
