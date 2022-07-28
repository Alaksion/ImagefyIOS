//
//  ImagefyService.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

enum ImagefyService {
    case listPhotos(page: Int)
    case getUserProfile(username: String)
}

extension ImagefyService : EndpointProtocol {
    var method: HTTPMethod {
        switch self {
        case .listPhotos:
            return HTTPMethod.get
        case .getUserProfile:
            return HTTPMethod.get
        }
    }
    
    var path: String {
        switch self {
        case .listPhotos:
            return "photos"
        case .getUserProfile(let userName):
            return "users/\(userName)"
        }
    }
    
    var headers: [String : String] {
        return [
            "Authorization" : "Client-ID smXXBhupy1xAZ6npy5NjO7XGmJ0fjuvLnQfaz_UwWlY"
        ]
    }
    
    var queries: [String : String] {
        switch self {
        case .listPhotos(let page):
            return ["page" : String(page)]
        case .getUserProfile:
            return [:]
        }
    }
    
}
