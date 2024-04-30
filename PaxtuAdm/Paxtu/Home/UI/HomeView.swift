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
    private let tabs: TabView
    
    init() {
        headerView = HeaderHomeView()
        carouselInformation = UIImageView()
        tabs = TabView(tab: .main)
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(headerView, carouselInformation, tabs)
        
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
            
            tabs.topAnchor.constraint(equalTo: carouselInformation.bottomAnchor, constant: 24),
            tabs.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            tabs.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            tabs.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300),
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        headerView.setupData(name: "Olá Mabel")
        
        carouselInformation.image = UIImage.information
        carouselInformation.contentMode = .scaleAspectFill
        carouselInformation.layer.cornerRadius = 20
        carouselInformation.clipsToBounds = true
    }
}
