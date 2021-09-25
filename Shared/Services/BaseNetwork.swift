//
//  BaseNetwork.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import Foundation

let baseUrl = "https://gateway.marvel.com"

// Remove from this
let apikey = "b256345b59f46e21b0bac3d0d479da20"
let ts = "1"
let hash = "87cc9fae1ac3af79adf700f5fae362d6"
let orderBy = "-modified"

struct HTTPMethods {
    static let GET = "GET"
    static let POST = "POST"
    static let PUT = "PUT"
    static let DELETE = "DELETE"
}

struct HTTPHeaders {
    static let CONTENT = "application/json"
}

enum endpoints: String {
 case characters = "/v1/public/characters"
}


struct BaseNetwork {
    func getAllCharacters() -> URLRequest {
        let url: String = "\(baseUrl)\(endpoints.characters.rawValue)"
        
        // TODO: add query params
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethods.GET
        request.addValue(HTTPHeaders.CONTENT, forHTTPHeaderField: "Content-type")
        
        return request
    }
}
