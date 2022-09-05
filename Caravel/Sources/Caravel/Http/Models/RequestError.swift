//
//  RequestError.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 09/07/22.
//

import Foundation

public enum RequestError: Error, Equatable {
    
    
    public static func == (lhs: RequestError, rhs: RequestError) -> Bool {
        switch (lhs, rhs) {
        case (.decode, .decode):
            return true
        case (.invalidURL, .invalidURL):
            return true
        case (.noResponse, .noResponse):
            return true
        case (.unauthorized, .unauthorized):
            return true
        case(.serverError, .serverError):
            return true
        case(.unknown, .unknown):
            return true
        default:
            return false
        }
    }
    
    case decode(error: Error)
    case invalidURL(url: String)
    case noResponse
    case unauthorized
    case serverError(statusCode: Int)
    case unknown
}
