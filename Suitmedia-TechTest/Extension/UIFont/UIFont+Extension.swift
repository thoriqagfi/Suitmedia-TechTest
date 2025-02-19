//
//  UIFont+Extension.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

extension UIFont {
    static func poppins(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        let fontName: String
        switch weight {
        case .bold:
            fontName = "Poppins-Bold"
        case .semibold:
            fontName = "Poppins-SemiBold"
        default:
            fontName = "Poppins-Regular"
        }
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}
