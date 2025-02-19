//
//  PrimaryButton.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 18/02/25.
//

import UIKit

final class ReusableButton: UIButton {
    enum ButtonTypeEnum {
        case primary
    }
    
    public private(set) var customButtonType: ButtonTypeEnum
    public private(set) var buttonText: String
    public private(set) var buttonColor: UIColor
    
    
    init(customButtonType: ButtonTypeEnum, buttonText: String, buttonColor: UIColor) {
        self.customButtonType = customButtonType
        self.buttonText = buttonText
        self.buttonColor = buttonColor
        
        super.init(frame: .zero)
        self.setTitle(buttonText, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.isUserInteractionEnabled = true
        self.isEnabled = true
        self.configureButtonColor()
        self.configureButtonStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButtonColor() {
        self.backgroundColor = buttonColor
    }
    
    private func configureButtonStyle() {
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 41).isActive = true
        self.widthAnchor.constraint(equalToConstant: 310).isActive = true
    }
}
