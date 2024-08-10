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
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 32),
            
            titleHeader.topAnchor.constraint(equalTo: backButton.topAnchor),
            titleHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleHeader.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        titleHeader.font = .HelveticaNeueBoldTwelve
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