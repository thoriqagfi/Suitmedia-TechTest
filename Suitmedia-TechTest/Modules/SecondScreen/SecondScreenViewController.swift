//
//  SecondScreenViewController.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class SecondScreenViewController: UIViewController {
    private let secondScreenViewModel: SecondScreenViewModel
    private lazy var secondScreenView = SecondScreenView(secondScreenViewModel: secondScreenViewModel)
    
    init(secondScreenViewModel: SecondScreenViewModel) {
        self.secondScreenViewModel = secondScreenViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = secondScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar(title: "Second Screen")
        setupBindings()
    }
    
    private func setupView() {
        view = secondScreenView
    }
    
    private func setupBindings() {
        secondScreenView.buttonChooseUser.addTarget(self, action: #selector(didTapChooseUser), for: .touchUpInside)
    }
    
    @objc private func didTapChooseUser() {
        let thirdScreenVC = ThirdScreenViewController()
        thirdScreenVC.onUserSelected = { [weak self] selectedUserName in
            self?.secondScreenViewModel.selectedUserName = selectedUserName
            self?.secondScreenView.updateSelectedUser(name: selectedUserName)
        }
        navigationController?.pushViewController(thirdScreenVC, animated: true)
    }
}
