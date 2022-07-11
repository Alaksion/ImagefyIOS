//
//  ImagefyRepositoryProtocol.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation

protocol ImagefyRepositoryProtocol {
    
    func getFeedPhotos(page: Int) async -> Result<[FeedPhoto], RequestError>
    
}
