//
//  EventsViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit

protocol EventsViewControllerProtocol: AnyObject {
    func showView(with model: EventsViewListModel)
}

final class EventsViewController: UIViewController {
    private let interactor: EventsInteractorProtocol
    
    init(interactor: EventsInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var theView: EventsView {
        return super.view as! EventsView
    }
    
    override func loadView() {
        super.loadView()
        let theView = EventsView()
        
        theView.onBackButton = {
            self.interactor.dissmissScreen()
        }
        
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        interactor.loadView()
    }
}

extension EventsViewController: EventsViewControllerProtocol {
    func showView(with model: EventsViewListModel) {
        theView.setupData(with: model)
    }
}
