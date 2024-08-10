//
//  NewActivityPresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit


protocol NewActivityPresenterProtocol: AnyObject {
    func presentView()
}

final class NewActivityPresenter: NewActivityPresenterProtocol {
    weak var view: NewActivityViewController?
    
    func presentView() {
        view?.showView(
            with: NewActivityViewModel(
                items: getInputInformation(),
                navigation: PaxtuNavigationModel(
                    buttonImage: UIImage.backIconNavigation,
                    titleHeader: "inserir nova atividade"
                ), 
                buttonTitle: "Cadastrar Atividade"
            )
        )
    }
    
    private func getInputInformation() -> [InputInformationModel] {
        let model: [InputInformationModel] = [
            InputInformationModel(
                title: "Nome Atividade",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            InputInformationModel(
                title: "Tipo de Atividade",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            InputInformationModel(
                title: "Seção",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            InputInformationModel(
                title: "Ramo",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            InputInformationModel(
                title: "Data Inicio",
                backgroundColor: .lightGray,
                typeKeyboard: .numberPad
            ),
            InputInformationModel(
                title: "Data Final",
                backgroundColor: .lightGray,
                typeKeyboard: .numberPad
            ),
            InputInformationModel(
                title: "Local",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            InputInformationModel(
                title: "Chefe responsável",
                backgroundColor: .lightGray,
                typeKeyboard: .default
            ),
            
        ]
        return model
    }
}
