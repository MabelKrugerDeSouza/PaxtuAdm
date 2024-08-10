//
//  HomeView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

final class HomeView: UIView {
    private let headerView: HeaderHomeView
    private let carouselView: CarouselView
    private let tabsSegment: CustomSegmentedControlView
    private let cardContentStack: UIStackView
    private let headerOfActivity: UILabel
    private let cardOfActivityCalendar: CardEventView
    
    var onButtonAction: ((TypeOfCard) -> Void)?
        
    init() {
        headerView = HeaderHomeView()
        carouselView = CarouselView()
        cardContentStack = UIStackView()
        tabsSegment = CustomSegmentedControlView()
        headerOfActivity = UILabel()
        cardOfActivityCalendar = CardEventView()
        
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
            headerView,
            carouselView,
            tabsSegment,
            headerOfActivity,
            cardOfActivityCalendar
        )
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 152),
            
            carouselView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            carouselView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            carouselView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            carouselView.heightAnchor.constraint(equalToConstant: 99),
            
            tabsSegment.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 32),
            tabsSegment.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            tabsSegment.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            headerOfActivity.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            headerOfActivity.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            cardOfActivityCalendar.topAnchor.constraint(equalTo: headerOfActivity.bottomAnchor, constant: 8),
            cardOfActivityCalendar.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            cardOfActivityCalendar.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            cardOfActivityCalendar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            cardOfActivityCalendar.heightAnchor.constraint(equalToConstant: 120),
        ])

    }
    
    private func renderView() {
        backgroundColor = .white
        
        headerOfActivity.font = .HelveticaNeueSemiBoldSixteen
        headerOfActivity.textAlignment = .left
        headerOfActivity.numberOfLines = 0
    
        carouselView.backgroundColor = .lightGray
        
        tabsSegment.onButtonAction = {[weak self] type in
            self?.onButtonAction?(type)
        }
    }
    
    func setupData(with model: HomeViewModel) {
        headerView.setupData(name: model.nameOfUser)
        tabsSegment.setupData(with: model.itensOfSegment)
        headerOfActivity.text = model.headerOfActivity
        cardOfActivityCalendar.setupData(with: model.informationOfActivity)
        carouselView.images = model.carouselImages
    }
}

struct HomeViewModel {
    let itensOfSegment: SegmentViewModel
    let nameOfUser: String
    let imagem: UIImage
    let headerOfActivity: String
    let informationOfActivity: CardEventViewModel
    let carouselImages: [UIImage]
}
