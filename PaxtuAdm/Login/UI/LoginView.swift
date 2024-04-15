//
//  LoginView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit

final class LoginView: UIView {
    let backgroundImage: UIImageView
    let titleAppImage: UIImageView
    let contentView: UIView
    let titleLabel: UILabel
    let descriptionLabel: UILabel
    let contentStack: UIStackView
    let subtitleUser: UILabel
    let textFieldUser: UITextField
    let subtitlePassword: UITextInputPasswordRules
    let contentStackButtons: UIStackView
    let loginButton: UIButton
    let forgotPasswordButton: UIButton
    
    init(
        backgroundImage: UIImageView,
        titleAppImage: UIImageView,
        contentView: UIView,
        titleLabel: UILabel,
        descriptionLabel: UILabel,
        contentStack: UIStackView,
        subtitleUser: UILabel,
        textFieldUser: UITextField,
        subtitlePassword: UITextInputPasswordRules,
        contentStackButtons: UIStackView,
        loginButton: UIButton,
        forgotPasswordButton: UIButton
    ) {
        self.backgroundImage = backgroundImage
        self.titleAppImage = titleAppImage
        self.contentView = contentView
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.contentStack = contentStack
        self.subtitleUser = subtitleUser
        self.textFieldUser = textFieldUser
        self.subtitlePassword = subtitlePassword
        self.contentStackButtons = contentStackButtons
        self.loginButton = loginButton
        self.forgotPasswordButton = forgotPasswordButton
        
        super.init(frame: .zero)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        addSubviews(backgroundImage, contentView)
        
        backgroundImage.addSubview(titleAppImage)
        contentView.addSubviews(contentStack, contentStackButtons)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalToConstant: 390),
            backgroundImage.heightAnchor.constraint(equalToConstant: 376),
            
            titleAppImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            titleAppImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            
            contentView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            contentStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            contentStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            contentStack.bottomAnchor.constraint(equalTo: contentStackButtons.topAnchor, constant: -12),
        ])
    }
}
