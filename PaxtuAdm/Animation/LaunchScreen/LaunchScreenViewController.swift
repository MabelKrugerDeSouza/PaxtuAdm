//
//  ViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit
import Lottie

final class LaunchScreenViewController: UIViewController {
    
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        setupConstraint()
    }
    
    private func setupAnimation() {
        view.backgroundColor = .white
        animationView.animation = LottieAnimation.named("launch_screen")
        animationView.isHidden = false
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
    private func setupConstraint() {
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 327),
        ])
    }
}

