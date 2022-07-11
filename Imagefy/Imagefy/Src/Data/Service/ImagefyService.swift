//
//  ImagefyService.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

enum ImagefyService {
    case listPhotos(page: Int)
}

extension ImagefyService : EndpointProtocol {
    var method: HTTPMethod {
        switch self {
        case .listPhotos:
            return HTTPMethod.get
        }
    }
    
    var path: String {
        switch self {
        case .listPhotos:
            return "photos"
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
        }
    }
    
}
