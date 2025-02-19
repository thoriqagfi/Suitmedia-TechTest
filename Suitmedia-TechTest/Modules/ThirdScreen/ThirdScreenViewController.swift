//
//  ThirdScreenViewController.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

import UIKit
import Combine

final class ThirdScreenViewController: UIViewController {
    private lazy var thirdScreenView = ThirdScreenView()
    private let viewModel = ThirdScreenViewModel()
    private var cancellables: Set<AnyCancellable> = []
    var onUserSelected: ((String) -> Void)?

    override func loadView() {
        view = thirdScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar(title: "Third Screen")
        setupBindings()
    }

    private func setupView() {
        thirdScreenView.tableView.delegate = self
        thirdScreenView.tableView.dataSource = self
        thirdScreenView.tableView.refreshControl = UIRefreshControl()
        thirdScreenView.tableView.refreshControl?.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
    }

    private func setupBindings() {
        viewModel.$users
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.thirdScreenView.tableView.reloadData() }
            .store(in: &cancellables)

        viewModel.$isRefreshing
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isRefreshing in
                if !isRefreshing {
                    self?.thirdScreenView.tableView.refreshControl?.endRefreshing()
                }
            }
            .store(in: &cancellables)

        viewModel.$isEmptyState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isEmpty in
                self?.thirdScreenView.emptyLabel.isHidden = !isEmpty
            }
            .store(in: &cancellables)
    }

    @objc private func refreshUsers() {
        viewModel.refreshUsers()
    }
}

extension ThirdScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.users.count - 1 {
            viewModel.loadMoreUsers()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = viewModel.users[indexPath.row]
        onUserSelected?(selectedUser.first_name + " " + selectedUser.last_name)
        navigationController?.popViewController(animated: true)
    }
}
