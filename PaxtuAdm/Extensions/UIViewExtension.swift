//
//  UIViewExtension.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 14/04/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
}
