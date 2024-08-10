//
//  HeaderHomeView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 28/04/24.
//

import UIKit

final class HeaderHomeView: UIView {
    private let roundedView: UIView
    private let iconProfile: UIImageView
    private let namePersonLabel: UILabel
    
    init() {
        roundedView = UIView()
        iconProfile = UIImageView()
        namePersonLabel = UILabel()
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(roundedView, namePersonLabel)
        
        roundedView.addSubview(iconProfile)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        roundedView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            roundedView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 16),
            roundedView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            roundedView.rightAnchor.constraint(equalTo: namePersonLabel.leftAnchor, constant: -8),
            roundedView.heightAnchor.constraint(equalToConstant: 62),
            roundedView.widthAnchor.constraint(equalToConstant: 62),
            
            iconProfile.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 4),
            iconProfile.leftAnchor.constraint(equalTo: roundedView.leftAnchor, constant: 4),
            iconProfile.rightAnchor.constraint(equalTo: roundedView.rightAnchor, constant: -4),
            iconProfile.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -4),
            
            namePersonLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 16),
            namePersonLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
        ])
    }
    
    private func renderView() {
        backgroundColor = .greenMain
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.cornerRadius = 32
        
        roundedView.layer.cornerRadius = 31
        roundedView.clipsToBounds = true
        roundedView.backgroundColor = .white
        
        iconProfile.image = UIImage.iconProfileHeader
        
        namePersonLabel.font = .HelveticaNeueBoldSixteen
        namePersonLabel.textAlignment = .left
        namePersonLabel.numberOfLines = 0
        namePersonLabel.textColor = .white
    }
    
    func setupData(name: String) {
        namePersonLabel.text = name
    }
}
