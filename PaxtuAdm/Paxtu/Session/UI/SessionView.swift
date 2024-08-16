//
//  SessionView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 13/08/24.
//

import UIKit

final class SessionView: UIView {
    private let navigation: PaxtuNavigation
    private let scrollView: UIScrollView
    private let viewOfColor: UIView
    private let iconImage: UIImageView
    private let nameOfSession: UILabel
    private let liderHeader: UILabel
    private let horizontalScroll: UIScrollView
    private let associationHeader: UILabel
    private let contentStackView: UIStackView
    
    init() {
        navigation = PaxtuNavigation()
        scrollView = UIScrollView()
        viewOfColor = UIView()
        iconImage = UIImageView()
        nameOfSession = UILabel()
        liderHeader = UILabel()
        horizontalScroll = UIScrollView()
        associationHeader = UILabel()
        contentStackView = UIStackView()
        
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(scrollView)
        scrollView.addSubviews(
            navigation,
            viewOfColor,
            iconImage,
            nameOfSession,
            liderHeader,
            horizontalScroll,
            associationHeader,
            contentStackView
        )
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        scrollView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
    }
}
