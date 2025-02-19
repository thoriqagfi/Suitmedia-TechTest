//
//  UIViewController+Extension.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

extension UIViewController {
    func setupNavigationBar(title: String, backButtonColor: UIColor = .purple) {
        self.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.font: UIFont.poppins(ofSize: 18, weight: .bold)]
        
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(handleBackButtonTapped)
        )
        backButton.tintColor = backButtonColor
        navigationItem.leftBarButtonItem = backButton
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = UIColor.lightGray
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.heightAnchor.constraint(equalToConstant: 0.5),
            bottomBorder.bottomAnchor.constraint(equalTo: navigationController!.navigationBar.bottomAnchor),
            bottomBorder.leadingAnchor.constraint(equalTo: navigationController!.navigationBar.leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor)
        ])
    }
    
    @objc private func handleBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, buttonText: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
