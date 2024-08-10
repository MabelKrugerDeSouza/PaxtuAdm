//
//  CardEventView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import UIKit

final class CardEventView: UIView {
    private let informationData: UILabel
    private let verticalLine: UIView
    private let stackFromInformation: UIStackView
    private let nameOfEvent: UILabel
    private let descriptionOfEvent: UILabel
    private let stackView: UIStackView
    
    init() {
        informationData = UILabel()
        verticalLine = UIView()
        stackFromInformation = UIStackView()
        nameOfEvent = UILabel()
        descriptionOfEvent = UILabel()
        stackView = UIStackView()
        
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        layer.cornerRadius = 20
        clipsToBounds = true
        
        // Configure informationData
        informationData.font = .HelveticaNeueBoldThirtySix
        informationData.textAlignment = .center
        informationData.numberOfLines = 0
        
        // Configure verticalLine
        verticalLine.backgroundColor = .black
        
        // Configure stackFromInformation
        stackFromInformation.axis = .vertical
        stackFromInformation.distribution = .fillEqually
        stackFromInformation.translatesAutoresizingMaskIntoConstraints = false
        stackFromInformation.addArrangedSubview(nameOfEvent)
        stackFromInformation.addArrangedSubview(descriptionOfEvent)
        
        nameOfEvent.font = .HelveticaNeueBoldSixteen
        nameOfEvent.textAlignment = .left
        nameOfEvent.numberOfLines = 0
        
        descriptionOfEvent.font = .HelveticaNeueRegularTwelve
        descriptionOfEvent.textAlignment = .left
        descriptionOfEvent.numberOfLines = 0
        
        // Add subviews
        addSubview(stackFromInformation)
    }
    
    private func setupConstraints() {
        addSubviews(
            informationData,
            verticalLine,
            stackFromInformation
        )
        
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            informationData.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            informationData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            informationData.trailingAnchor.constraint(equalTo: verticalLine.leadingAnchor, constant: -8),
            informationData.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            informationData.widthAnchor.constraint(equalToConstant: 60),
            
            verticalLine.topAnchor.constraint(equalTo: informationData.topAnchor),
            verticalLine.trailingAnchor.constraint(equalTo: stackFromInformation.leadingAnchor, constant: -8),
            verticalLine.bottomAnchor.constraint(equalTo: informationData.bottomAnchor),
            verticalLine.widthAnchor.constraint(equalToConstant: 2),
            
            stackFromInformation.topAnchor.constraint(equalTo: informationData.topAnchor),
            stackFromInformation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackFromInformation.bottomAnchor.constraint(equalTo: informationData.bottomAnchor),
        ])
    }
    
    func setupData(with model: CardEventViewModel) {
        informationData.text = model.data
        nameOfEvent.text = model.nameOfEvent
        descriptionOfEvent.text = model.descriptionOfEvent
    }
}
struct CardEventViewModel {
    let data: String
    let nameOfEvent: String
    let descriptionOfEvent: String
}
