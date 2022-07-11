//
//  EndpointProtocol.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queries: [String: String] { get }
}

/**
Default Base url is unsplash's api url.
Queries and Headers are empty by default
*/
extension EndpointProtocol {
    
    var baseURL: String { "https://api.unsplash.com/" }
    
    var headers: [String: String] { [ : ] }
    var queries: [String: String] { [ : ] }
    
}
