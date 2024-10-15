//
//  User.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//

import Foundation

typealias Users = [User]

struct User: Codable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
}

struct Address: Codable {
    
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Location
}

struct Location: Codable {
    
    let lat: String
    let lng: String
}


struct Company: Codable {
    
    let name: String
    let catchPhrase: String
    let bs: String
}
