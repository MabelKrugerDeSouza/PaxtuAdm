//
//  CardTabView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 28/04/24.
//

import UIKit

enum TypeOfCard {
    case newActivity
    case events
    case session
    case associates
    case activities
    case library
    case schoolCamp
}

final class CardTabViewCell: UICollectionViewCell {
    static let identifier = "CardTabViewCell"
    
    private let card: UIControl
    private let titleOfCardLabel: UILabel
    
    var typeOfTab: Tabs = .main
    var type: TypeOfCard = .newActivity
    var onCardAction: ((TypeOfCard) -> Void)?
    
    init() {
        card = UIControl()
        titleOfCardLabel = UILabel()
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(card)
        card.addSubview(titleOfCardLabel)
        
        titleOfCardLabel.translatesAutoresizingMaskIntoConstraints = false
        card.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: topAnchor),
            card.leftAnchor.constraint(equalTo: leftAnchor),
            card.rightAnchor.constraint(equalTo: rightAnchor),
            card.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleOfCardLabel.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 24),
            titleOfCardLabel.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -24),
            titleOfCardLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -4)
        ])
    }
    
    private func renderView() {
        card.backgroundColor = .lightGray
        card.layer.cornerRadius = 15
        card.layer.borderColor = UIColor.black.cgColor
        card.layer.borderWidth = 2
        
        titleOfCardLabel.font = .HelveticaNeueRegularTwelve
        titleOfCardLabel.textColor = .black
        titleOfCardLabel.textAlignment = .center
        titleOfCardLabel.numberOfLines = 0
        
        card.addTarget(self, action: #selector(didTapCard), for: .touchUpInside)
    }
    
    func setupData(with model: CardTabModel) {
        titleOfCardLabel.text = model.titleOfCard
        type = model.typeOfCard
        typeOfTab = model.tab
    }
    
    @objc
    private func didTapCard() {
        onCardAction?(type)
    }
}
