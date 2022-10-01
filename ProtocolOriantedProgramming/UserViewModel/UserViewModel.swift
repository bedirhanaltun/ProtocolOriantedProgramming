//
//  UserViewModel.swift
//  ProtocolOriantedProgramming
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import Foundation

class UserViewModel {
    
    private let userService: UserService
    weak var output: UserViewModelProtocol?
    
    init(userService: UserService){
        self.userService = userService
    }
    
    func fetchUsers() {
        
        userService.getUsers { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, username: user.username)
            case.failure(let error):
                self?.output?.updateView(name: "There is no user.", email: "-", username: "-")
            }
        }
    }
}
