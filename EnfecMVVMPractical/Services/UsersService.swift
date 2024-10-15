//
//  UsersService.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//


import Foundation

protocol UsersServiceProtocol {
    func getUsers(completion: @escaping (_ success: Bool, _ results: Users?, _ error: String?) -> ())
}

class UsersService: UsersServiceProtocol {
    func getUsers(completion: @escaping (Bool, [User]?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://jsonplaceholder.typicode.com/users") { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Users.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Users to model")
                }
            } else {
                completion(false, nil, "Error: Users GET Request failed")
            }
        }
    }
}
