//
//  PhotoDetailsResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 14/08/22.
//

import Foundation
import UIKit

struct PhotoDetailsResponse: Decodable {
    let id: String
    let color: String
    let downloads: Int
    let likes: Int
    let description: String?
    let urls: PhotoDetailsLinksResponse
}

extension PhotoDetailsResponse {
    func mapToDomain() -> PhotoDetails {
        return PhotoDetails(
            id: self.id,
            downloads: self.downloads,
            likes: self.likes,
            color: UIColor(hexString: self.color),
            links: self.urls.mapToDomain()
        )
    }
}
