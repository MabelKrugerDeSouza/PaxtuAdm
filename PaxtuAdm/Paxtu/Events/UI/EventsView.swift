//
//  EventsView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 10/08/24.
//

import UIKit

final class EventsView: UIView {
    private let navigation: PaxtuNavigation
    private let scrollView: UIScrollView
    private let contentStackView: UIStackView
    
    var onBackButton: (() -> Void)?
    
    init() {
        navigation = PaxtuNavigation()
        scrollView = UIScrollView()
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
        addSubviews(navigation, scrollView)
        scrollView.addSubviews(contentStackView)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        scrollView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: topAnchor),
            navigation.leftAnchor.constraint(equalTo: leftAnchor),
            navigation.rightAnchor.constraint(equalTo: rightAnchor),
            
            scrollView.topAnchor.constraint(equalTo: navigation.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            contentStackView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: 24),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        navigation.onNavigationAction = {[weak self] in
            self?.onBackButton?()
        }
    }
    
    private func setContentStack(with events: [EventsViewModel]) {
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.spacing = 16

        events.forEach { item in
            if let title = item.typeOfEventiTitle {
                let titleLabel = UILabel()
                titleLabel.font = .HelveticaNeueBoldTwentyFour
                titleLabel.textAlignment = .left
                titleLabel.numberOfLines = 0
                titleLabel.text = title
                
                contentStackView.addArrangedSubview(titleLabel)
                contentStackView.setCustomSpacing(8, after: titleLabel)
            }
            
            let cardOfEvent = CardEventView()
            cardOfEvent.setupData(with: item.cardOfEvent)
            contentStackView.addArrangedSubview(cardOfEvent)
            contentStackView.setCustomSpacing(16, after: cardOfEvent)
        }
    }
    
    func setupData(with model: EventsViewListModel) {
        navigation.setupData(with: model.navigation)
        setContentStack(with: model.listOfEvents)
    }
}

struct EventsViewModel {
    let typeOfEventiTitle: String?
    let cardOfEvent: CardEventViewModel
}

struct EventsViewListModel {
    let navigation: PaxtuNavigationModel
    let listOfEvents: [EventsViewModel]
}

