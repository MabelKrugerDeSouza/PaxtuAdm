//
//  HomeInteractor.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    func loadView()
}

final class HomeInteractor: HomeInteractorProtocol {
    private let presenter: HomePresenterProtocol
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadView() {
        presenter.presentView()
    }
}
