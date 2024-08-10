//
//  HomeViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showView(with model: HomeViewModel)
}

final class HomeViewController: UIViewController {
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: HomeView {
        return super.view as! HomeView
    }
    
    override func loadView() {
        super.loadView()
        let theView = HomeView()
        
        theView.onButtonAction = {[weak self] type in
            self?.interactor.goToScreen(of: type)
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        interactor.loadView()
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func showView(with model: HomeViewModel) {
        theView.setupData(with: model)
    }
}
