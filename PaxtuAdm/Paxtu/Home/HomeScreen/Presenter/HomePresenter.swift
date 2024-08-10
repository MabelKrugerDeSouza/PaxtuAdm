//
//  HomePresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    func presentView()
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewControllerProtocol?
    
    func presentView() {
        view?.showView(
            with: HomeViewModel(
            itensOfSegment: presentSegmentItems(),
            nameOfUser: "Olá, Mabel",
            imagem: UIImage.iconProfileHeader, 
            headerOfActivity: "Próximos Eventos", 
            informationOfActivity:
                CardEventViewModel(
                    data: "26",
                    nameOfEvent: "ACAMGELB - Aniversário 66 anos GELB",
                    descriptionOfEvent: "Acampamento de grupo \nGELB"
                ), 
            carouselImages:
                [
                    UIImage.informationCarousel,
                    UIImage.iconProfile
                ]
            )
        )
    }
    
    private func presentSegmentItems() -> SegmentViewModel {
        let model = SegmentViewModel(
            itens: [
                CardTabModel(titleOfCard: "Nova Atividade", typeOfCard: .newActivity, itemOfSegment: .main),
                CardTabModel(titleOfCard: "Eventos", typeOfCard: .events, itemOfSegment: .main),
                CardTabModel(titleOfCard: "Sessão", typeOfCard: .session, itemOfSegment: .main),
                CardTabModel(titleOfCard: "Associados", typeOfCard: .associates, itemOfSegment: .main),
                CardTabModel(titleOfCard: "Atividade", typeOfCard: .activities, itemOfSegment: .other),
                CardTabModel(titleOfCard: "Biblioteca", typeOfCard: .library, itemOfSegment: .other),
                CardTabModel(titleOfCard: "Campo Escola", typeOfCard: .schoolCamp, itemOfSegment: .other),
            ])
        return model
    }
}
