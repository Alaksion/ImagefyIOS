//
//  AuthorProfileVmDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 29/07/22.
//

import Foundation
import Caravel

protocol AuthorProfileVmDelegate {
    func onAuthorProfileResponse(data: UserProfile)
    func onAuthorProfileError(error: RequestError)
    func onAuthorPhotosResponse(data: [UserProfilePhoto])
}
