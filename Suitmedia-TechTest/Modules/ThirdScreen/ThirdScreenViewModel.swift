//
//  ThirdScreenViewModel.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import Foundation
import Combine

final class ThirdScreenViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var isRefreshing = false
    @Published var isEmptyState = false
    
    private var currentPage = 1
    private var totalPages = 1
    private let apiService: APIService
    
    init(apiService: APIService = DefaultAPIService()) {
        self.apiService = apiService
        fetchUsers(refresh: true)
    }
    
    func fetchUsers(refresh: Bool) {
        guard !isLoading else { return }
        
        if refresh {
            currentPage = 1
            users.removeAll()
        }
        
        isLoading = true
        apiService.fetchUsers(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            self.isRefreshing = false
            
            switch result {
            case .success(let response):
                self.totalPages = response.total_pages
                self.users.append(contentsOf: response.data)
                self.isEmptyState = self.users.isEmpty
                
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }
    
    func loadMoreUsers() {
        guard currentPage < totalPages else { return }
        currentPage += 1
        fetchUsers(refresh: false)
    }
    
    func refreshUsers() {
        isRefreshing = true
        fetchUsers(refresh: true)
    }
}
