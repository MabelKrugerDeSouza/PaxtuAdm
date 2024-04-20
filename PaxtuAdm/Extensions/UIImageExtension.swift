//
//  UIImageExtension.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 16/04/24.
//

import UIKit

extension UIImage {
    static let backgroundImage: UIImage = UIImage(named: "background-login").safeImage
    static let titleImage: UIImage = UIImage(named: "logo-paxtu").safeImage
}

extension Optional where Wrapped == UIImage {
    var safeImage: UIImage {
        return self ?? UIImage()
    }
}
