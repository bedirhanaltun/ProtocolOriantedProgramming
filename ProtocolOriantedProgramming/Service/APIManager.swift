//
//  APIManager.swift
//  ProtocolOriantedProgramming
//
//  Created by Bedirhan Altun on 1.10.2022.
//

import Foundation


class APIManager: UserService {
 
    func getUsers(completion: @escaping(Result<User,Error>) -> Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last{
                    completion(.success(user))
                }
                else{
                    completion(.failure(NSError()))
                }
            }

            
        }.resume()
        
        
    }
}
