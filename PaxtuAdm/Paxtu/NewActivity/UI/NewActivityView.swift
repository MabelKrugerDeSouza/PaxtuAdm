//
//  NewActivityView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 09/08/24.
//

import UIKit

final class NewActivityView: UIView {
    private let navigation: PaxtuNavigation
    private let scrollView: UIScrollView
    private let contentStackView: UIStackView
    private let buttonCreateActivity: CustomButton
    
    var onButtonCreateActivityAction: (() -> Void)?
    var onBackButtonAction: (() -> Void)?
    
    init() {
        navigation = PaxtuNavigation()
        scrollView = UIScrollView()
        contentStackView = UIStackView()
        buttonCreateActivity = CustomButton(withStyle: .greenFilled)
        
        super.init(frame: .zero)
        
        setupConstraints()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        addSubviews(
            navigation,
            scrollView
        )
        
        scrollView.addSubviews(
            contentStackView,
            buttonCreateActivity
        )
        
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
            contentStackView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            
            buttonCreateActivity.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 32),
            buttonCreateActivity.leftAnchor.constraint(equalTo: contentStackView.leftAnchor, constant: 16),
            buttonCreateActivity.rightAnchor.constraint(equalTo: contentStackView.rightAnchor, constant: -16),
            buttonCreateActivity.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        buttonCreateActivity.addTarget(self, action: #selector(didTabButtonCreatedActivity), for: .touchUpInside)
        
        navigation.onNavigationAction = {[weak self] in
            self?.onBackButtonAction?()
        }
        
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func setupData(with model: NewActivityViewModel) {
        navigation.setupData(with: model.navigation)
        setContentStack(with: model.items)
        buttonCreateActivity.setupData(title: model.buttonTitle)
    }
    
    private func setContentStack(with listOfTextField: [InputInformationModel]) {
        contentStackView.axis = .vertical
        contentStackView.distribution = .fillEqually
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        listOfTextField.forEach { model in
            let inputTextField = UIInputIInformationView(isBold: false)
            inputTextField.setupData(with: model)
            contentStackView.addArrangedSubview(inputTextField)
            contentStackView.setCustomSpacing(16, after: inputTextField)
        }
    }
    
    @objc
    private func didTabButtonCreatedActivity() {
        onButtonCreateActivityAction?()
    }
}

struct NewActivityViewModel {
    let items: [InputInformationModel]
    let navigation: PaxtuNavigationModel
    let buttonTitle: String
}
