//
//  LauchScreenPresenter.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import Foundation
import Lottie

protocol LauchScreenPresenterProtocol: AnyObject {
    func presentView()
}

final class LauchScreenPresenter: LauchScreenPresenterProtocol {
    weak var view: LaunchScreenViewController?
    
    func presentView() {
        guard let animation = LottieAnimation.named("launch_screen") else {return}
        view?.showView(
            with: AnimationModel(
                animation: animation,
                loopModel: .playOnce
            )
        )
    }
}
