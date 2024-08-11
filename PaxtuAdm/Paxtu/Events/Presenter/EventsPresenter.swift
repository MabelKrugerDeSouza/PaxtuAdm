//
//  EventsPresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit

protocol EventsPresenterProtocol: AnyObject {
    func presentView()
}

final class EventsPresenter: EventsPresenterProtocol {
    weak var view: EventsViewControllerProtocol?
    
    func presentView() {
        view?.showView(
            with: EventsViewListModel(
                navigation: PaxtuNavigationModel(
                    buttonImage: UIImage.backIconNavigation,
                    titleHeader: "Eventos"
                ),
                listOfEvents: getTheEventsFromList()
            )
        )
    }
    
    private func getTheEventsFromList() -> [EventsViewModel] {
        let model = [
            EventsViewModel(
                typeOfEventiTitle: "Internacional",
                cardOfEvent: CardEventViewModel(
                    data: "2025",
                    nameOfEvent: "16º Word Scout Moot Modial - Portugal", 
                    descriptionOfEvent: "Portugal \n25/07/2025 até 03/08/2024"
                )
            ),
            
            EventsViewModel(
                typeOfEventiTitle: nil,
                cardOfEvent: CardEventViewModel(
                    data: "2025",
                    nameOfEvent: "16º Word Scout Moot Modial - Portugal",
                    descriptionOfEvent: "Portugal \n25/07/2025 até 03/08/2024"
                )
            ),
            
            EventsViewModel(
                typeOfEventiTitle: "Nacional",
                cardOfEvent: CardEventViewModel(
                    data: "2024",
                    nameOfEvent: "Jamboree Centenário",
                    descriptionOfEvent: "Barretos - SP \n13/07/2024 até 19/07/2024"
                )
            ),
            
            EventsViewModel(
                typeOfEventiTitle: "Regional / Destrital",
                cardOfEvent: CardEventViewModel(
                    data: "2024",
                    nameOfEvent: "Bivaque Aquatico",
                    descriptionOfEvent: "Parque Gralha Azul \nEndereço: Estrada João Pedro de Oliveira, Bairro : Itinga 2 - Cidade : Barra Velha"
                )
            ),
        ]
        
        return model
    }
}
