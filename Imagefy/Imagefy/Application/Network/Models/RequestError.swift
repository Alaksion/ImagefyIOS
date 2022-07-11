//
//  RequestError.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case serverError
    case unknown
}
