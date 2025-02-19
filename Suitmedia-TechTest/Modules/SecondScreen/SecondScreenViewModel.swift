//
//  SecondScreenViewModel.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class SecondScreenViewModel {
    @Published var userName: String

    init(userName: String) {
        self.userName = userName
    }
}
