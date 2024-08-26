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
    static let iconProfileHeader: UIImage = UIImage(named: "iconProfile").safeImage
    static let informationCarousel: UIImage = UIImage(named: "information").safeImage
    static let backIconNavigation: UIImage = UIImage(named: "backIcon").safeImage
    static let sessionRover: UIImage = UIImage(named: "cla-pioneiro").safeImage
    static let iconLiderOne: UIImage = UIImage(named: "iconLider1").safeImage
    static let iconLiderTwo: UIImage = UIImage(named: "iconLider2").safeImage
}

extension Optional where Wrapped == UIImage {
    var safeImage: UIImage {
        return self ?? UIImage()
    }
}
