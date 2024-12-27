//
//  PaxtuNavigation.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 09/08/24.
//

import UIKit

final class PaxtuNavigation: UIView {
    private let backButton: UIButton
    private let titleHeader: UILabel
    
    var onNavigationAction: (() -> Void)?
    
    init() {
        backButton = UIButton(type: .custom)
        titleHeader = UILabel()
        
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
            backButton,
            titleHeader
        )
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            backButton.rightAnchor.constraint(equalTo: titleHeader.leftAnchor),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 26),
            backButton.widthAnchor.constraint(equalToConstant: 28),
            
            titleHeader.topAnchor.constraint(equalTo: backButton.topAnchor),
            titleHeader.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            titleHeader.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
        ])
    }
    
    private func renderView() {
        backgroundColor = .clear
        
        titleHeader.font = .HelveticaNeueBoldTwelve
        titleHeader.textColor = .black
        titleHeader.textAlignment = .center
        titleHeader.numberOfLines = 0
        
        backButton.addTarget(self, action: #selector(didTapOnNavigationAction), for: .touchUpInside)
    }
    
    func setupData(with model: PaxtuNavigationModel) {
        backButton.setImage(model.buttonImage, for: .normal)
        titleHeader.text = model.titleHeader.uppercased()
    }
    
    @objc
    private func didTapOnNavigationAction() {
        onNavigationAction?()
    }
}

struct PaxtuNavigationModel {
    let buttonImage: UIImage
    let titleHeader: String
}
