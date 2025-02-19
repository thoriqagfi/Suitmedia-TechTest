//
//  FirstscreenView.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 18/02/25.
//

import UIKit

final class FirstScreenView: UIView {
    lazy var inputName = ReusableInput(placeholder: "Name")
    lazy var inputPalindrome = ReusableInput(placeholder: "Palindrome")
    lazy var buttonCheck = ReusableButton(customButtonType: .primary, buttonText: "CHECK", buttonColor: .Green)
    lazy var buttonNext = ReusableButton(customButtonType: .primary, buttonText: "NEXT", buttonColor: .Green)

    private lazy var inputStackView = ReusableStackView(arrangedSubviews: [inputName, inputPalindrome], spacing: 24)
    private lazy var buttonStackView = ReusableStackView(arrangedSubviews: [buttonCheck, buttonNext], spacing: 16)
    private lazy var profileImageView = ReusableImage(imageName: "IconPhoto", width: 116, height: 116, cornerRadius: 0)
    private lazy var mainStackView = ReusableStackView(arrangedSubviews: [inputStackView, buttonStackView], spacing: 45)
    private lazy var containerStackView = ReusableStackView(arrangedSubviews: [profileImageView, mainStackView], spacing: 58)

    private var backgroundImageView = ReusableImage(imageName: "BackgroundFirstScreen", width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, cornerRadius: 0)

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(containerStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Background image constraints
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            // Main container stack view constraints
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
