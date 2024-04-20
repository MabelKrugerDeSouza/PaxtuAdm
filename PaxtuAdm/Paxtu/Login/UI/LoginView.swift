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
    let titleLabel: UILabel
    let contentView: UIView
    let descriptionLabel: UILabel
    let textFieldUser: UIInputIInformationView
    let textFieldPassword: UIInputIInformationView
    let contentStackButtons: UIStackView
    let loginButton: CustomButton
    let forgotPasswordButton: CustomButton
    
    var onLoginButtonAction: (() -> Void)?
    var onForgotPasswordButtonAction: (() -> Void)?
    
    init() {
        self.backgroundImage = UIImageView()
        self.titleAppImage = UIImageView()
        self.contentView = UIView()
        self.titleLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.textFieldUser = UIInputIInformationView()
        self.textFieldPassword = UIInputIInformationView()
        self.contentStackButtons = UIStackView()
        self.loginButton = CustomButton(withStyle: .greenFilled)
        self.forgotPasswordButton = CustomButton(withStyle: .textGreen)
        
        super.init(frame: .zero)
        
        setupContraints()
        renderView()
        setupConstentButton()
        setupOnAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        addSubviews(
            backgroundImage,
            contentView
        )
        
        backgroundImage.addSubview(titleAppImage)
        
        contentView.addSubviews(
            titleLabel,
            descriptionLabel,
            textFieldUser,
            textFieldPassword,
            contentStackButtons
        )
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        backgroundImage.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        contentView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        contentStackButtons.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.widthAnchor.constraint(equalToConstant: 398),
            backgroundImage.heightAnchor.constraint(equalToConstant: 376),
            
            titleAppImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            titleAppImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            titleAppImage.widthAnchor.constraint(equalToConstant: 270),
            titleAppImage.heightAnchor.constraint(equalToConstant: 70),
            
            contentView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -88),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            
            textFieldUser.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            textFieldUser.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textFieldUser.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldUser.bottomAnchor, constant: 24),
            textFieldPassword.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textFieldPassword.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            contentStackButtons.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            contentStackButtons.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            contentStackButtons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
    }
    
    private func renderView() {
        backgroundColor = .white
        
        backgroundImage.contentMode = .scaleToFill
       
        titleAppImage.contentMode = .scaleAspectFill
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 50
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        
        titleLabel.font = .HelveticaNeueBoldTwentyEight
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = .HelveticaNeueRegularSixteen
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
    }
    
    
    private func setupConstentButton() {
        contentStackButtons.axis  = .vertical
        contentStackButtons.distribution  = .fillEqually
        
        contentStackButtons.addArrangedSubview(loginButton)
        contentStackButtons.setCustomSpacing(16, after: loginButton)
        contentStackButtons.addArrangedSubview(forgotPasswordButton)
    }
    
    private func setupOnAction() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
    }
    
    func setupData(with model: LoginModel) {
        backgroundImage.image = model.backgroundImage
        titleAppImage.image = model.titleLogo
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        textFieldUser.setupData(with: InputInformationModel(
            title: model.titlePrimaryTextField,
            backgroundColor: .lightGray,
            typeKeyboard: .default
        ))
        textFieldPassword.setupData(with: InputInformationModel(
            title: model.titleSecondaryTextField,
            backgroundColor: .lightGray,
            typeKeyboard: .default
        ))
        loginButton.setupData(title: model.titleFirstButton)
        forgotPasswordButton.setupData(title: model.titleSecondButton)
        
    }
    
    @objc
    private func didTapLoginButton() {
        onLoginButtonAction?()
    }
    
    @objc
    private func didTapForgotPasswordButton() {
        onForgotPasswordButtonAction?()
    }
}
