//
//  UserProfileImagesResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 28/07/22.
//

import Foundation

struct UserProfileImageResponse: Decodable {
    let small: String
    let medium: String
    let large: String
}
