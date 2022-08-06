//
//  UserProfilePhoto.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 01/08/22.
//

import Foundation
import UIKit

struct UserProfilePhotoResponse: Decodable {
    let id: String
    let width: Int
    let height: Int
    let color: String
    let urls: UserProfilePhotoUrls
}

struct UserProfilePhotoUrls : Decodable {
    let small: String
    let thumb: String
}


extension UserProfilePhotoResponse {
    func mapToUserPhoto() -> UserProfilePhoto {
        return UserProfilePhoto(
            url: self.urls.thumb,
            color: .systemGray
        )
    }
}
