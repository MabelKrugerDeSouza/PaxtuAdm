//
//  CardOfLiderView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 12/08/24.
//

import UIKit

final class CardOfLiderView: UIView {
    private let icon: UIImageView
    private let nameOfLider: UILabel
    
    init() {
        icon = UIImageView()
        nameOfLider = UILabel()
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraint() {
        addSubviews(icon, nameOfLider)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor),
            icon.leftAnchor.constraint(equalTo: leftAnchor),
            icon.rightAnchor.constraint(equalTo: rightAnchor),
            icon.heightAnchor.constraint(equalToConstant: 106),
            icon.widthAnchor.constraint(equalToConstant: 106),
            
            nameOfLider.topAnchor.constraint(equalTo: icon.bottomAnchor,constant: 8),
            nameOfLider.leftAnchor.constraint(equalTo: leftAnchor),
            nameOfLider.rightAnchor.constraint(equalTo: rightAnchor),
            nameOfLider.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func renderView() {
        backgroundColor = .clear
        
        icon.layer.cornerRadius = 53
        icon.clipsToBounds = true
        icon.backgroundColor = .white
        
        nameOfLider.font = .HelveticaNeueRegularEighteen
        nameOfLider.textColor = .black
        nameOfLider.textAlignment = .center
        nameOfLider.numberOfLines = 0
    }
    
    func setupData(with model: CardOfLiderViewModel) {
        icon.image = model.image
        nameOfLider.text = model.name
    }
}

struct CardOfLiderViewModel {
    let image: UIImage
    let name: String
}
