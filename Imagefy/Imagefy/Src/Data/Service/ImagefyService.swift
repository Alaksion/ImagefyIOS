//
//  ImagefyService.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation
import Caravel

enum ImagefyService {
    case listPhotos(page: Int)
    case getUserProfile(username: String)
    case getUserPhotos(username: String, page: Int)
    case getPhoto(withId: String)
}

extension ImagefyService : EndpointProtocol {
    var method: HTTPMethod {
        switch self {
        case .listPhotos:
            return HTTPMethod.get
        case .getUserProfile:
            return HTTPMethod.get
        case .getUserPhotos:
            return HTTPMethod.get
        case .getPhoto:
            return HTTPMethod.get
        }
    }
    
    var path: String {
        switch self {
        case .listPhotos:
            return "photos"
        case .getUserProfile(let userName):
            return "users/\(userName)"
        case .getUserPhotos(let username, _):
            return "users/\(username)/photos/"
        case .getPhoto(let id):
            return "photos/\(id)"
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
        case .getUserPhotos(_, let page):
            return ["page" : String(page)]
        case .getPhoto:
            return [:]
        }
    }
    
}
