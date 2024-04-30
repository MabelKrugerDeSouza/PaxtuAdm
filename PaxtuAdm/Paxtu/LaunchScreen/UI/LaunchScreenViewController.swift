//
//  ViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit
import Lottie

final class LaunchScreenViewController: UIViewController {
    
    private let coordinator: PaxtuCoordinatorProtocol
    
    init(coordinator: PaxtuCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: LauchScreenView {
        return self.view as! LauchScreenView
    }
    
    override func loadView() {
        super.loadView()
        let theView = LauchScreenView()
        
        theView.animationComplete = {[weak self] in
            self?.coordinator.goToLogin()
        }

        self.view = theView
    }
}
