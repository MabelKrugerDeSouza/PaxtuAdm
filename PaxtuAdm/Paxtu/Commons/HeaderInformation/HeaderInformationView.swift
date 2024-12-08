//
//  HeaderInformationView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 03/09/24.
//

import UIKit

final class HeaderInformationView: UIView {
    private let navigation: PaxtuNavigation
    private let viewOfColor: UIView
    private let iconImage: UIImageView
    private let nameOfSession: UILabel
    private let liderHeader: UILabel
    private let contentStackLider: UIStackView
    private let horizontalScroll: UIScrollView
    
    var onBackButtonAction: (() -> Void)?
    
    init() {
        navigation = PaxtuNavigation()
        viewOfColor = UIView()
        iconImage = UIImageView()
        nameOfSession = UILabel()
        liderHeader = UILabel()
        contentStackLider = UIStackView()
        horizontalScroll = UIScrollView()
        
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
            viewOfColor,
            iconImage,
            nameOfSession,
            liderHeader,
            horizontalScroll
        )
        
        
        
        viewOfColor.addSubview(navigation)
        horizontalScroll.addSubview(contentStackLider)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
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
            
            liderHeader.topAnchor.constraint(equalTo: nameOfSession.bottomAnchor, constant: 16),
            liderHeader.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            liderHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            horizontalScroll.topAnchor.constraint(equalTo: liderHeader.bottomAnchor, constant: 16),
            horizontalScroll.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            horizontalScroll.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            horizontalScroll.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            horizontalScroll.heightAnchor.constraint(equalToConstant: 170),
            
            contentStackLider.topAnchor.constraint(equalTo: horizontalScroll.topAnchor),
            contentStackLider.leftAnchor.constraint(equalTo: horizontalScroll.leftAnchor),
            contentStackLider.rightAnchor.constraint(equalTo: horizontalScroll.rightAnchor),
            contentStackLider.bottomAnchor.constraint(equalTo: horizontalScroll.bottomAnchor),
            contentStackLider.heightAnchor.constraint(equalTo: horizontalScroll.heightAnchor),
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
    
    func setupData(with model: HeaderInformationViewModel) {
        navigation.setupData(with: model.navigationTitle)
        iconImage.image = model.imageOfSession
        nameOfSession.text = model.sessionName
        liderHeader.text = model.liderTitle
        setupContentStackViewLider(listOfLider: model.listOfLider)
    }
}

struct HeaderInformationViewModel {
    let navigationTitle: PaxtuNavigationModel
    let imageOfSession: UIImage
    let sessionName: String
    let liderTitle: String
    let listOfLider: [CardOfLiderViewModel]
}
