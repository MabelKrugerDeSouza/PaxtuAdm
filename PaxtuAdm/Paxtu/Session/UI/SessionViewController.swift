//
//  SessionViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 25/08/24.
//

import UIKit

protocol SessionViewControllerProtocol: AnyObject {
    func showView(with model: SessionViewModel)
}

final class SessionViewController: UIViewController {
    private let interactor: SessionInteractorProtocol
    
    init(interactor: SessionInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: SessionView {
        return super.view as! SessionView
    }
    
    override func loadView() {
        super.loadView()
        let theView = SessionView()
        
        theView.onBackButtonAction = {
            self.interactor.dismissFlow()
        }
        
        theView.onActionOfCardAssociate = {[weak self] name in
            print("o nome tocado foi \(name)")
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadView()
    }
}

extension SessionViewController: SessionViewControllerProtocol {
    func showView(with model: SessionViewModel) {
        theView.setupData(with: model)
    }
}
