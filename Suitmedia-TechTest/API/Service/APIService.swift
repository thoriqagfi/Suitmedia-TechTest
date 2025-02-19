//
//  APIService.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import Foundation

protocol APIService {
    func fetchUsers(page: Int, completion: @escaping (Result<UserResponse, Error>) -> Void)
}

final class DefaultAPIService: APIService {
    private let baseURL = "https://reqres.in/api"

    func fetchUsers(page: Int, completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let urlString = "\(baseURL)/users?page=\(page)&per_page=10"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
}
