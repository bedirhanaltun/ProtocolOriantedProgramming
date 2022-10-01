//
//  UserViewModelProtocol.swift
//  ProtocolOriantedProgramming
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import Foundation

protocol UserViewModelProtocol: AnyObject {
    func updateView(name: String, email: String, username: String)
}
