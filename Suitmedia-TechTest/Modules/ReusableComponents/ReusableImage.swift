//
//  ReusableImage.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class ReusableImage: UIImageView {
    init(imageName: String, width: CGFloat = 80, height: CGFloat = 80, cornerRadius: CGFloat = 40) {
        super.init(frame: .zero)
        configureImage(imageName: imageName, width: width, height: height, cornerRadius: cornerRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImage(imageName: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) {
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
