//
//  HomeView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

final class HomeView: UIView {
    private let headerView: HeaderHomeView
    private let carouselInformation: UIImageView
    private let tabsSegment: CustomSegmentedControlView
    private let cardContentStack: UIStackView
    private let cardView: CardTabView
        
    init() {
        headerView = HeaderHomeView()
        carouselInformation = UIImageView()
        cardContentStack = UIStackView()
        tabsSegment = CustomSegmentedControlView()
        cardView = CardTabView()
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(headerView, carouselInformation, tabsSegment, cardContentStack)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            carouselInformation.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 32),
            carouselInformation.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            carouselInformation.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            carouselInformation.heightAnchor.constraint(equalToConstant: 99),
            carouselInformation.widthAnchor.constraint(equalToConstant: 366),
            
            tabsSegment.topAnchor.constraint(equalTo: carouselInformation.bottomAnchor, constant: 24),
            tabsSegment.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            tabsSegment.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
           
            cardContentStack.topAnchor.constraint(equalTo: tabsSegment.bottomAnchor, constant: 32),
            cardContentStack.leftAnchor.constraint(equalTo: tabsSegment.leftAnchor),
            cardContentStack.rightAnchor.constraint(equalTo: tabsSegment.rightAnchor),
            cardContentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
            cardView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        headerView.setupData(name: "Olá Mabel")
        
        carouselInformation.image = UIImage.information
        carouselInformation.contentMode = .scaleAspectFill
        carouselInformation.layer.cornerRadius = 20
        carouselInformation.clipsToBounds = true
    
        setupConstraint()
    }
    
    private func setupContentStack() {
        cardContentStack.axis = .vertical
        cardContentStack.distribution = .fillProportionally
        cardContentStack.translatesAutoresizingMaskIntoConstraints = false
        
        cardContentStack.addArrangedSubview(cardView)
        cardContentStack.setCustomSpacing(10, after: cardView)
        cardContentStack.addArrangedSubview(cardView)
    }
}
