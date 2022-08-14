//
//  PhotoDetails.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 14/08/22.
//

import Foundation
import UIKit

struct PhotoDetails {
    let id: String
    let downloads: Int
    let likes: Int
    let color: UIColor
    let links: PhotoDetailsLinks
}

struct PhotoDetailsLinks {
    let small: String
    let thumb: String
    let regular: String
    let full: String
    let raw: String
}
