//
//  ReusableLabel.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class ReusableLabel: UILabel {
    init(text: String, fontSize: CGFloat, weight: UIFont.Weight, textAlignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = .label
        self.font = UIFont.poppins(ofSize: fontSize, weight: weight)
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
