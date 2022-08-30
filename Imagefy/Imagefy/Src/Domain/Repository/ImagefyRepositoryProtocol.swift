//
//  ImagefyRepositoryProtocol.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 11/07/22.
//

import Foundation
import Caravel

protocol ImagefyRepositoryProtocol {
    
    func getFeedPhotos(page: Int) async -> Result<[FeedPhoto], RequestError>
    
    func getUserProfile(username: String) async -> Result<UserProfile, RequestError>
    
    func getUserPhotos(username: String, page: Int) async -> Result<[UserProfilePhoto], RequestError>
    
    func getPhotoDetails(withId id: String) async -> Result<PhotoDetails, RequestError>
    
}
