//
//  HomeInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    func loadView()
    func goToScreen(of card: TypeOfCard)
}

final class HomeInteractor: HomeInteractorProtocol {
    private let presenter: HomePresenterProtocol
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(presenter: HomePresenterProtocol, coordinator: PaxtuCoordinatorProtocol) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func loadView() {
        presenter.presentView()
    }
    
    func goToScreen(of card: TypeOfCard) {
        switch card {
        case .newActivity:
            coordinator.goToNewActivity()
        case .events:
            coordinator.goToEvents()
        case .session:
            coordinator.goToSession()
        case .associates:
            coordinator.goToAssociates()
        case .activities:
            coordinator.goToActivities()
        case .library:
            coordinator.goToLibrary()
        case .schoolCamp:
            coordinator.goToSchoolCamp()
        }
    }
}
