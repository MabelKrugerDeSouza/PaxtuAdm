//
//  ViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit
import Lottie

protocol LaunchScreenViewControllerProtocol: AnyObject {
    func showView(with model: AnimationModel)
}

final class LaunchScreenViewController: UIViewController {
    
    private let interactor: LauchScreenInteractorProtocol
    
    init(interactor: LauchScreenInteractorProtocol) {
        self.interactor = interactor
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
            self?.interactor.animationComplete()
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadView()
    }
}

extension LaunchScreenViewController: LaunchScreenViewControllerProtocol {
    func showView(with model: AnimationModel) {
        theView.setupData(with: model)
    }
}
