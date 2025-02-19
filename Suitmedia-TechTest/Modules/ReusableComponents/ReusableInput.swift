//
//  ReusableInput.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 18/02/25.
//

import UIKit

final class ReusableInput: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        configureInput(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInput(placeholder: String) {
        self.placeholder = placeholder
        self.borderStyle = .none
        self.textColor = .black
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.font = UIFont.poppins(ofSize: 16, weight: .regular)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = .white
        self.clipsToBounds = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 41).isActive = true
        self.widthAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
}
