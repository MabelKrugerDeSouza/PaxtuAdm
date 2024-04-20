//
//  CustomButton.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit

enum StyleButton {
    case greenFilled
    case textGreen
    
    var color: UIColor {
        switch self {
        case .greenFilled, .textGreen:
            return .greenMain
        }
    }
}

final class CustomButton: UIButton {
    
    var style = StyleButton.greenFilled {
        didSet {
            updateStyleButton()
        }
    }
    
    init(withStyle: StyleButton) {
        self.style = withStyle
        
        super.init(frame: .zero)
        
        setupButtom()
        updateStyleButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtom() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        titleLabel?.font = .HelveticaNeueBoldSixteen
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    func setupData(title: String) {
        setTitle(title, for: .normal)
    }
    
    private func updateStyleButton() {
        switch style {
        case .greenFilled:
            setTitleColor(.white, for: .normal)
            setBackgroudColor(.greenMain, state: .normal)
            layer.borderWidth = 0
        case .textGreen:
            setTitleColor(.greenMain, for: .normal)
            setBackgroudColor(.white, state: .normal)
            layer.borderWidth = 0
        }
    }
    
    
    private func setBackgroudColor(_ color: UIColor, state: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
            .image(actions: { context in
                color.setFill()
                context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            })
        setBackgroundImage(colorImage, for: state)
    }
}
