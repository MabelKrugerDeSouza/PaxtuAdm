//
//  classTest.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import UIKit

class CustomSegmentedControlView: UIView {
    private let buttonContainerView: UIView
    private let segmentedControl: UISegmentedControl
    
    private var modelItens: SegmentViewModel?
    
    var onButtonAction: ((TypeOfCard) -> Void)?
    
    init(){
        buttonContainerView = UIView()
        segmentedControl = UISegmentedControl(items: ["principais".uppercased(), "outros".uppercased()])
        
        super.init(frame: .zero)
        
        renderView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubviews(segmentedControl, buttonContainerView)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonContainerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            buttonContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func renderView() {
        segmentedControl.selectedSegmentTintColor = .greenMain
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func setupData(with model: SegmentViewModel) {
        modelItens = model
        updateButtonLayout(for: 0)
    }
    
    private func updateButtonLayout(for index: Int) {
        buttonContainerView.subviews.forEach { $0.removeFromSuperview() }
        
        guard let modelItens = modelItens else { return }
        
        let index = segmentedControl.selectedSegmentIndex
        let is2x2Layout = index == 0
        let buttons = createButtonLayout(is2x2: is2x2Layout, with: modelItens)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonContainerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: buttonContainerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor)
        ])
    }
    
    private func createButtonLayout(is2x2: Bool, with model: SegmentViewModel) -> [UIView] {
        if is2x2 {
            var buttonsMain: [UIView] = []
            model.itens.forEach { item in
                if item.itemOfSegment == .main {
                    let button = CardTabView()
                    button.setupData(with: item)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    buttonsMain.append(button)
                    
                    button.onCardAction = {[weak self] type in
                        self?.onButtonAction?(type)
                    }
                }
            }
            return createLayout(from: buttonsMain, is2x2: is2x2)
            
        } else {
            var buttons: [UIView] = []
            model.itens.forEach { item in
                if item.itemOfSegment == .other {
                    let button = CardTabView()
                    button.setupData(with: item)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    buttons.append(button)
                    
                    button.onCardAction = {[weak self] type in
                        self?.onButtonAction?(type)
                    }
                }
            }
            return createLayout(from: buttons, is2x2: is2x2)
        }
    }
    
    private func createLayout(from buttons: [UIView], is2x2: Bool) -> [UIView] {
        let horizontalStack1 = UIStackView(arrangedSubviews: Array(buttons[0...1]))
        horizontalStack1.axis = .horizontal
        horizontalStack1.distribution = .fillEqually
        horizontalStack1.spacing = 8
        
        let horizontalStack2 = UIStackView(arrangedSubviews: is2x2 ? Array(buttons[2...3]) : [buttons[2]])
        horizontalStack2.axis = .horizontal
        horizontalStack2.distribution = .fillEqually
        horizontalStack2.spacing = 8
        
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack1, horizontalStack2])
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 8
        
        return [verticalStack]
    }
    
    @objc
    private func segmentedControlValueChanged() {
        updateButtonLayout(for: segmentedControl.selectedSegmentIndex)
    }
}

struct SegmentViewModel {
    let itens: [CardTabModel]
    
}


