//
//  SecondScreenViewModel.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class SecondScreenViewModel {
    @Published var userName: String
    @Published var selectedUserName: String?

    init(userName: String, selectedUserName: String? = nil) {
        self.userName = userName
        self.selectedUserName = selectedUserName
    }
}
