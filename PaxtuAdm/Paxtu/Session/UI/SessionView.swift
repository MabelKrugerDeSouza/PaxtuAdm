//
//  SessionView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 13/08/24.
//

import UIKit

final class SessionView: UIView {
    private let navigation: PaxtuNavigation
    private let scrollView: UIScrollView
    private let viewOfColor: UIView
    private let iconImage: UIImageView
    private let nameOfSession: UILabel
    private let liderHeader: UILabel
    private let contentStackLider: UIStackView
    private let horizontalScroll: UIScrollView
    private let associationHeader: UILabel
    private let contentStackView: UIStackView
    
    var onBackButtonAction: (() -> Void)?
    
    init() {
        navigation = PaxtuNavigation()
        scrollView = UIScrollView()
        viewOfColor = UIView()
        iconImage = UIImageView()
        nameOfSession = UILabel()
        liderHeader = UILabel()
        contentStackLider = UIStackView()
        horizontalScroll = UIScrollView()
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
            scrollView,
            viewOfColor,
            iconImage,
            nameOfSession
        )
        
        scrollView.addSubviews(
            liderHeader,
            horizontalScroll,
            associationHeader,
            contentStackView
        )
        
        viewOfColor.addSubview(navigation)
        horizontalScroll.addSubview(contentStackLider)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        scrollView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        viewOfColor.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        horizontalScroll.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            viewOfColor.topAnchor.constraint(equalTo: topAnchor),
            viewOfColor.leftAnchor.constraint(equalTo: leftAnchor),
            viewOfColor.rightAnchor.constraint(equalTo: rightAnchor),
            viewOfColor.heightAnchor.constraint(equalToConstant: 199),
            
            navigation.topAnchor.constraint(equalTo: viewOfColor.topAnchor, constant: 16),
            navigation.leftAnchor.constraint(equalTo: viewOfColor.leftAnchor),
            navigation.rightAnchor.constraint(equalTo: viewOfColor.rightAnchor, constant: -24),
            
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 141),
            iconImage.heightAnchor.constraint(equalToConstant: 139),
            iconImage.topAnchor.constraint(equalTo: viewOfColor.topAnchor, constant: 130),
            
            nameOfSession.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 24),
            nameOfSession.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: nameOfSession.bottomAnchor, constant: 8),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            liderHeader.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            liderHeader.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24),
            liderHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            horizontalScroll.topAnchor.constraint(equalTo: liderHeader.bottomAnchor, constant: 16),
            horizontalScroll.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24),
            horizontalScroll.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            horizontalScroll.heightAnchor.constraint(equalToConstant: 170),
            
            contentStackLider.topAnchor.constraint(equalTo: horizontalScroll.topAnchor),
            contentStackLider.leftAnchor.constraint(equalTo: horizontalScroll.leftAnchor),
            contentStackLider.rightAnchor.constraint(equalTo: horizontalScroll.rightAnchor),
            contentStackLider.bottomAnchor.constraint(equalTo: horizontalScroll.bottomAnchor),
            contentStackLider.heightAnchor.constraint(equalTo: horizontalScroll.heightAnchor),
            
            associationHeader.topAnchor.constraint(equalTo: horizontalScroll.bottomAnchor, constant: 16),
            associationHeader.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24),
            associationHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            contentStackView.topAnchor.constraint(equalTo: associationHeader.bottomAnchor, constant: 24),
            contentStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        viewOfColor.backgroundColor = .lightRed.withAlphaComponent(0.5)
        
        iconImage.layer.cornerRadius = 31
        iconImage.clipsToBounds = true
        
        nameOfSession.font = .HelveticaNeueBoldTwentyFour
        nameOfSession.textAlignment = .center
        nameOfSession.numberOfLines = 0
        
        liderHeader.font = .HelveticaNeueBoldSixteen
        liderHeader.textAlignment = .left
        liderHeader.numberOfLines = 0
        
        associationHeader.font = .HelveticaNeueBoldSixteen
        associationHeader.textAlignment = .left
        associationHeader.numberOfLines = 0
        
        navigation.onNavigationAction = {[weak self] in
            self?.onBackButtonAction?()
        }
    }
    
    private func setupContentStackViewLider(listOfLider: [CardOfLiderViewModel]) {
        contentStackLider.axis = .horizontal
        contentStackLider.spacing = 10
        contentStackLider.translatesAutoresizingMaskIntoConstraints = false
        contentStackLider.subviews.forEach { $0.removeFromSuperview() }
        
        listOfLider.forEach { model in
            let itemView = CardOfLiderView()
            itemView.setupData(with: model)
            contentStackLider.addArrangedSubview(itemView)
            contentStackLider.setCustomSpacing(24, after: itemView)
        }
        
        contentStackLider.layoutIfNeeded()
    }
    
    private func setupContentStackView(listOfAssociates: [String]) {
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.subviews.forEach { $0.removeFromSuperview() }
        
        listOfAssociates.forEach { name in
            let itemView = UILabel()
            itemView.text = name
            itemView.font = .HelveticaNeueBoldTwelve
            itemView.textAlignment = .left
            itemView.numberOfLines = 0
            contentStackView.addArrangedSubview(itemView)
            contentStackView.setCustomSpacing(8, after: itemView)
        }
    }
    
    func setupData(with model: SessionViewModel) {
        navigation.setupData(with: model.navigationTitle)
        iconImage.image = model.imageOfSession
        nameOfSession.text = model.sessionName
        liderHeader.text = model.liderTitle
        setupContentStackViewLider(listOfLider: model.listOfLider)
        associationHeader.text = model.associatesTitle
        setupContentStackView(listOfAssociates: model.listOfAssociates)
    }
}


struct SessionViewModel {
    let navigationTitle: PaxtuNavigationModel
    let imageOfSession: UIImage
    let sessionName: String
    let liderTitle: String
    let listOfLider: [CardOfLiderViewModel]
    let associatesTitle: String
    let listOfAssociates: [String]
}

