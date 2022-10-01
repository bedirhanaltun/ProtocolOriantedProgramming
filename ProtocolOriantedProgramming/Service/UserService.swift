//
//  UserService.swift
//  ProtocolOriantedProgramming
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import Foundation

protocol UserService {
    func getUsers(completion: @escaping(Result<User,Error>) -> Void)
}
