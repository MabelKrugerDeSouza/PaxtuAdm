//
//  AssociatesView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 26/08/24.
//

import UIKit


final class AssociatesView: UIView {
    private let controlView: UIControl
    private let nameOfAssociate: UILabel
    private let icon: UIImageView
    
    private var nameTap = ""
    
    var onActionCard: ((String) -> Void)?
    
    init() {
        controlView = UIControl()
        nameOfAssociate = UILabel()
        icon = UIImageView()
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(controlView)
        controlView.addSubviews(nameOfAssociate, icon)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        controlView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            controlView.topAnchor.constraint(equalTo: topAnchor),
            controlView.leftAnchor.constraint(equalTo: leftAnchor),
            controlView.rightAnchor.constraint(equalTo: rightAnchor),
            controlView.bottomAnchor.constraint(equalTo: bottomAnchor),
            controlView.heightAnchor.constraint(equalToConstant: 30),
            
            nameOfAssociate.topAnchor.constraint(equalTo: controlView.topAnchor, constant: 4),
            nameOfAssociate.leftAnchor.constraint(equalTo: controlView.leftAnchor, constant: 4),
            nameOfAssociate.bottomAnchor.constraint(equalTo: controlView.bottomAnchor),
            
            icon.topAnchor.constraint(equalTo: nameOfAssociate.topAnchor, constant: 8),
            icon.rightAnchor.constraint(equalTo: controlView.rightAnchor, constant: -8),
            icon.bottomAnchor.constraint(equalTo: nameOfAssociate.bottomAnchor, constant: -8),
            icon.heightAnchor.constraint(equalToConstant: 8),
            icon.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func renderView() {
        backgroundColor = .clear
        
        nameOfAssociate.font = .HelveticaNeueRegularEighteen
        nameOfAssociate.textColor = .black
        nameOfAssociate.textAlignment = .left
        nameOfAssociate.numberOfLines = 0
        
        icon.image = UIImage.iconPlus
    }
    
    func setupData(with name: String) {
        nameOfAssociate.text = name
        nameTap = name
        
        controlView.addTarget(self, action: #selector(didTapActionOfCard), for: .touchUpInside)
    }
    
    @objc
    private func didTapActionOfCard() {
        onActionCard?(nameTap)
    }
}

