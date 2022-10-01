//
//  ProtocolOriantedProgrammingTests.swift
//  ProtocolOriantedProgrammingTests
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import XCTest
@testable import ProtocolOriantedProgramming

class ProtocolOriantedProgrammingTests: XCTestCase {
    
    private var userViewModel: UserViewModel!
    private var userService: MockUserService!
    private var output: MockUserViewModelOutput!

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showsUser() throws {
        let mockUser = User(id: 1, name: "Bedirhan", username: "bedo", email: "bedo@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.last?.username, "bedo")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.last?.name, "There is no user.")
    }

}

class MockUserService: UserService {
    
    var fetchUserMockResult: Result<User, Error>?
    
    func getUsers(completion: @escaping (Result<User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutput: UserViewModelProtocol {
    
    var updateViewArray : [(name: String, email: String, username: String)] = []
    func updateView(name: String, email: String, username: String) {
        updateViewArray.append((name,email,username))
    }
    
    
}
