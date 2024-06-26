//
//  LauchScreenView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit
import Lottie

final class LauchScreenView: UIView {
    private let animationView: LottieAnimationView
    
    var animationComplete: (() -> Void)?
    
    init() {
        animationView = LottieAnimationView()

        super.init(frame: .zero)
        
        setupConstraint()
        setupAnimation()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(animationView)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 233),
            animationView.heightAnchor.constraint(equalToConstant: 320),
        ])
    }
    
    private func setupAnimation() {
        backgroundColor = .white
        
        animationView.animation = LottieAnimation.named("launch_screen")
        
        animationView.play {[weak self] _ in
            self?.animationComplete?()
        }
    }
}
