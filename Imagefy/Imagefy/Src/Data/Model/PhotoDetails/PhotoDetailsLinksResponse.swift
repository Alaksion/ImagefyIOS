//
//  PhotoDetailsLinks.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 14/08/22.
//

import Foundation

struct PhotoDetailsLinksResponse: Decodable {
    let raw: String
    let regular: String
    let full: String
    let small : String
    let thumb: String
}

extension PhotoDetailsLinksResponse {
    func mapToDomain() -> PhotoDetailsLinks {
        return PhotoDetailsLinks(
            small: self.small,
            thumb: self.thumb,
            regular: self.regular,
            full: self.full,
            raw: self.raw
        )
    }
}
