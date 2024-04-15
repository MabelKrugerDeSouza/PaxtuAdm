//
//  ViewController.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
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
    
    //Teste para subir o commit
    private func setupAnimation() {
        view.backgroundColor = .black
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

