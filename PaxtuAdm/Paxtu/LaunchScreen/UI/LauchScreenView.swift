//
//  LauchScreenView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 20/04/24.
//

import UIKit
import Lottie

final class LauchScreenView: UIView {
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var animationComplete: (() -> Void)?
    
    init() {
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
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor, multiplier: 24/14),
        ])
    }
    
    private func setupAnimation() {
        backgroundColor = .white
    }
    
    func setupData(with model: AnimationModel) {
        animationView.animation = model.animation
        animationView.isHidden = false
        animationView.loopMode = model.loopModel
        
        if model.loopModel == .playOnce {
            animationView.play {[weak self] _ in
                self?.animationComplete?()
            }
        }
    }
}
