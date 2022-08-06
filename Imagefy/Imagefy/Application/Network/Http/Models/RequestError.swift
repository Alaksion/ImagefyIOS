//
//  RequestError.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation

enum RequestError: Error {
    case decode(error: Error)
    case invalidURL(url: String)
    case noResponse
    case unauthorized
    case serverError(statusCode: Int)
    case unknown
}
