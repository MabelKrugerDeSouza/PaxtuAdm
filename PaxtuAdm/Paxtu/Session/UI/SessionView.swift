//
//  SessionView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 13/08/24.
//

import UIKit

final class SessionView: UIView {
    private let headerInformation: HeaderInformationView
    private let scrollView: UIScrollView
    private let associationHeader: UILabel
    private let contentStackView: UIStackView
    
    var onBackButtonAction: (() -> Void)?
    var onActionOfCardAssociate: ((String) -> Void)?
    
    init() {
        headerInformation = HeaderInformationView()
        scrollView = UIScrollView()
        associationHeader = UILabel()
        contentStackView = UIStackView()
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(
            headerInformation,
            scrollView,
            associationHeader
        )
        
        scrollView.addSubviews(
            contentStackView
        )
        
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        scrollView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            headerInformation.topAnchor.constraint(equalTo: topAnchor),
            headerInformation.leftAnchor.constraint(equalTo: leftAnchor),
            headerInformation.rightAnchor.constraint(equalTo: rightAnchor),
            
            associationHeader.topAnchor.constraint(equalTo: headerInformation.bottomAnchor, constant: 8),
            associationHeader.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            associationHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            scrollView.topAnchor.constraint(equalTo: associationHeader.bottomAnchor, constant: 8),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            contentStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        associationHeader.font = .HelveticaNeueBoldSixteen
        associationHeader.textAlignment = .left
        associationHeader.numberOfLines = 0
        
        headerInformation.onBackButtonAction = {[weak self] in
            self?.onBackButtonAction?()
        }
    }
    
    private func setupContentStackView(listOfAssociates: [String]) {
        contentStackView.axis = .vertical
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.subviews.forEach { $0.removeFromSuperview() }
        
        listOfAssociates.forEach { name in
            let itemView = AssociatesView()
            itemView.setupData(with: name)
            itemView.onActionCard = {[weak self] name in
                self?.onActionOfCardAssociate?(name)
            }
            contentStackView.addArrangedSubview(itemView)
            contentStackView.setCustomSpacing(8, after: itemView)
        }
    }
    
    func setupData(with model: SessionViewModel) {
        headerInformation.setupData(with: model.headerInformationModel)
        associationHeader.text = model.associatesTitle
        setupContentStackView(listOfAssociates: model.listOfAssociates)
    }
}


struct SessionViewModel {
    let headerInformationModel: HeaderInformationViewModel
    let associatesTitle: String
    let listOfAssociates: [String]
}

