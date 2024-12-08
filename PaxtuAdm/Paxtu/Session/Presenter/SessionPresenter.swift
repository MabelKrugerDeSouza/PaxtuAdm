//
//  SessionPresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 25/08/24.
//

import UIKit

protocol SessionPresenterProtocol: AnyObject {
    func presentView()
}
 
final class SessionPresenter: SessionPresenterProtocol {
    weak var view: SessionViewControllerProtocol?
    
    func presentView() {
        view?.showView(
            with: SessionViewModel(
                headerInformationModel:
                    HeaderInformationViewModel(
                        navigationTitle: PaxtuNavigationModel(buttonImage: .backIcon, titleHeader: "Sessão"),
                        imageOfSession: UIImage.sessionRover,
                        sessionName: "Clã do Max",
                        liderTitle: "Mestria",
                        listOfLider: getLiderOfSession()
                    ),
                associatesTitle: "Associados",
                listOfAssociates:  getListOfAssociates()
            )
        )
    }
    
    func getLiderOfSession() -> [CardOfLiderViewModel] {
        let liders: [CardOfLiderViewModel] = [
            CardOfLiderViewModel(
                image: UIImage.iconLider1,
                name: "Mestra Ana Filipa"
            ),
            CardOfLiderViewModel(
                image: UIImage.iconLider2,
                name: "Mestra Sara"
            ),
        ]
        
        return liders
    }
    
    func getListOfAssociates() -> [String] {
        let associates: [String] = [
            "Mabel",
            "Heloise", 
            "Carolina",
            "Maria Eduarda",
            "Pedro",
            "Emily",
            "Luana",
            "Thor",
            "Mateus"
        ]
        
        return associates
    }
}
