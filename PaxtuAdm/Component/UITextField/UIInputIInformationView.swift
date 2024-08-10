//
//  UIInputIInformationView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

final class UIInputIInformationView: UIView {
    
    private let titleTextField: UILabel
    private let inputTextField: UITextField
    private let isBoldTheTitle: Bool
    
    init(isBold: Bool) {
        titleTextField = UILabel()
        inputTextField = UITextField()
        isBoldTheTitle = isBold
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(titleTextField, inputTextField)
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: topAnchor),
            titleTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            titleTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            inputTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 4),
            inputTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            inputTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            inputTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func renderView() {
        titleTextField.font = isBoldTheTitle ? .HelveticaNeueBoldSixteen : .HelveticaNeueRegularSixteen
        titleTextField.textColor = .black
        titleTextField.numberOfLines = 0
      
        inputTextField.delegate = self
        inputTextField.autocorrectionType = .no
        inputTextField.clearButtonMode = .whileEditing;
        inputTextField.layer.cornerRadius = 10
        inputTextField.layer.borderWidth = 1
        inputTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupData(with model: InputInformationModel) {
        titleTextField.text = model.title
        inputTextField.backgroundColor = model.backgroundColor
        inputTextField.keyboardType = model.typeKeyboard
    }
}

extension UIInputIInformationView: UITextFieldDelegate {
    
}
