//
//  classTest.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 05/08/24.
//

import UIKit

class CustomSegmentedControlView: UIView {
    private var buttonCount: Int
    private let buttonContainerView: UIView
    private let segmentedControl: UISegmentedControl
    
    init(){
        buttonCount = Int()
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
            
            buttonContainerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
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
        
        updateButtonLayout(for: 0)
    }
    
    private func updateButtonLayout(for index: Int) {
        buttonContainerView.subviews.forEach { $0.removeFromSuperview() }
        
        let buttonLayouts: [UIView]
        
        if index == 0 {
            buttonCount = 4
            // Layout 2x2
            buttonLayouts = create2x2ButtonLayout()
        } else {
            buttonCount = 3
            // Layout 2x2 with button 3 on new row
            buttonLayouts = create2x2WithButton3OnNewRow()
        }
        
        buttonLayouts.forEach { buttonContainerView.addSubview($0) }
        
        let stackView = UIStackView(arrangedSubviews: buttonLayouts)
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
    
    private func create2x2ButtonLayout() -> [UIView] {
        var buttons: [UIView] = []
        
        for i in 0..<4 {
            let button = CardTabView()
            button.setTitle("Button \(i + 1)", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            buttons.append(button)
        }
        
        let horizontalStack1 = UIStackView(arrangedSubviews: [buttons[0], buttons[1]])
        horizontalStack1.axis = .horizontal
        horizontalStack1.distribution = .fillEqually
        horizontalStack1.spacing = 8
        
        let horizontalStack2 = UIStackView(arrangedSubviews: [buttons[2], buttons[3]])
        horizontalStack2.axis = .horizontal
        horizontalStack2.distribution = .fillEqually
        horizontalStack2.spacing = 8
        
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack1, horizontalStack2])
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 8
        
        return [verticalStack]
    }
    
    private func create2x2WithButton3OnNewRow() -> [UIView] {
        var buttons: [UIView] = []
        
        for i in 0..<3 {
            let button = CardTabView()
            button.setTitle("Button \(i + 1)", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            buttons.append(button)
        }
        
        let horizontalStack1 = UIStackView(arrangedSubviews: [buttons[0], buttons[1]])
        horizontalStack1.axis = .horizontal
        horizontalStack1.distribution = .fillEqually
        horizontalStack1.spacing = 8
        
        let horizontalStack2 = UIStackView(arrangedSubviews: [buttons[2]])
        horizontalStack2.axis = .horizontal
        horizontalStack2.distribution = .fillEqually
        horizontalStack2.spacing = 8
        horizontalStack2.alignment = .leading
        
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


