//
//  NewActivityViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit

protocol NewActivityViewControllerProtocol: AnyObject {
    func showView(with model: NewActivityViewModel)
}

final class NewActivityViewController: UIViewController {
    private let interactor: NewActivityInteractorProtocol
   
    init(interactor: NewActivityInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: NewActivityView {
        return super.view as! NewActivityView
    }
    
    override func loadView() {
        super.loadView()
        let theView = NewActivityView()
        
        theView.onBackButtonAction = {
            self.interactor.dismissScreen()
        }
        
        theView.onButtonCreateActivityAction = {[weak self] in
            self?.interactor.dismissScreen()
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadView()
    }
}


extension NewActivityViewController: NewActivityViewControllerProtocol {
    func showView(with model: NewActivityViewModel) {
        theView.setupData(with: model)
    }
}
