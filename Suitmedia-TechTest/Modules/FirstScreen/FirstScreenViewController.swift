//
//  FirstScreenViewController.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 18/02/25.
//

import UIKit

final class FirstScreenViewController: UIViewController {
    private lazy var firstScreenView = FirstScreenView()
    private let firstScreenViewModel = FirstScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }

    private func setupView() {
        view = firstScreenView
    }

    private func setupBindings() {
        firstScreenView.inputName.addTarget(self, action: #selector(nameTextChanged), for: .editingChanged)
        firstScreenView.buttonCheck.addTarget(self, action: #selector(handleCheckButtonTapped), for: .touchUpInside)
        firstScreenView.buttonNext.addTarget(self, action: #selector(handleNextButtonTapped), for: .touchUpInside)
    }

    @objc private func nameTextChanged() {
        firstScreenViewModel.userName = firstScreenView.inputName.text ?? ""
    }

    @objc private func handleCheckButtonTapped() {
        let text = firstScreenView.inputPalindrome.text?.lowercased().replacingOccurrences(of: " ", with: "") ?? ""
        
        let isPalindrome = text == String(text.reversed())
        let message = isPalindrome ? "isPalindrome" : "not palindrome"
        
        showAlert(title: "Palindrome Check", message: message)
    }
    
    @objc private func handleNextButtonTapped() {
        let userName = firstScreenViewModel.userName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if userName.isEmpty {
            showAlert(title: "Input Required", message: "Please enter your name to continue.")
            return
        }
        
        let secondScreenViewModel = SecondScreenViewModel(userName: userName)
        let secondScreenViewController = SecondScreenViewController(secondScreenViewModel: secondScreenViewModel)
        navigationController?.pushViewController(secondScreenViewController, animated: true)
    }
}
