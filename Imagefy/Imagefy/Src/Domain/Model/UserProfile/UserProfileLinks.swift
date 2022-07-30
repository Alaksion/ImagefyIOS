//
//  UserProfileLinks.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 28/07/22.
//

import Foundation

enum UserProfileLinkType {
    case instagram
    case twitter
    case other
}

struct UserProfileLinks {
    let type: UserProfileLinkType
    let label: String
    let url: String
}
