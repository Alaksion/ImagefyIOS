//
//  FeedPhotos.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation
import UIKit

struct FeedPhoto {
    let authorName: String
    let authorUsername: String
    let id : String
    let createdAt: Date
    let color: UIColor
    let likes : Int
    let description: String
    let urls : FeedPhotoUrls
    let autorProfilePic : String
}

struct FeedPhotoUrls {
    let raw: String
    let full: String
    let regular: String
    let thumb: String
}

