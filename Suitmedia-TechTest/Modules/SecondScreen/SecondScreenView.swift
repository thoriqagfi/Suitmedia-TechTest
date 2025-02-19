//
//  SecondScreenView.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit
import Combine

final class SecondScreenView: UIView {
    private let secondScreenViewModel: SecondScreenViewModel
    
    lazy var buttonChooseUser = ReusableButton(customButtonType: .primary, buttonText: "Choose a User", buttonColor: .Green)
    lazy var welcomeText = ReusableLabel(text: "Welcome", fontSize: 12, weight: .regular)
    lazy var nameText = ReusableLabel(text: secondScreenViewModel.userName, fontSize: 18, weight: .semibold)
    lazy var selectedUserText = ReusableLabel(text: secondScreenViewModel.selectedUserName ?? "No User Selected", fontSize: 24, weight: .bold)
    
    private lazy var topLeftContainerStackView = ReusableStackView(arrangedSubviews: [welcomeText, nameText], spacing: 0, alignment: .leading)
    
    init(secondScreenViewModel: SecondScreenViewModel) {
        self.secondScreenViewModel = secondScreenViewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(topLeftContainerStackView)
        addSubview(selectedUserText)
        addSubview(buttonChooseUser)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topLeftContainerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            topLeftContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topLeftContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            selectedUserText.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectedUserText.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectedUserText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            selectedUserText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonChooseUser.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonChooseUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonChooseUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonChooseUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func updateSelectedUser(name: String) {
        selectedUserText.text = name
    }
}
