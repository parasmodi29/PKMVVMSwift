//
//  HttpRequestHelper.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//

import Foundation

class HttpRequestHelper {
    func GET(url: String, complete: @escaping (Bool, Data?) -> ()) {
        
        var url = URL(string: url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        // .ephemeral prevent JSON from caching (They'll store in Ram and nothing on Disk)
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                print(error!)
                complete(false, nil)
                return
            }
            guard let data = data else {
                print("Error: did not receive data")
                complete(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                complete(false, nil)
                return
            }
            complete(true, data)
        }.resume()
    }
}
