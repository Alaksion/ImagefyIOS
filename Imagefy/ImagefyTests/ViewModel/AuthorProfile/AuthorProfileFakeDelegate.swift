//
//  AuthorProfileFakeDelegate.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 04/09/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel

final class AuthorProfileVmFakeDelegate: AuthorProfileVmDelegate  {
    
    var completionObserver = { }
    var authorProfileCalled = false
    var authorErrorNotifier: (RequestError) -> Void = { error in}
    var authorPhotosNotifier: ([UserProfilePhoto]) -> Void = { photos in }
    
    func onAuthorProfileResponse(data: UserProfile) {
        completionObserver()
        authorProfileCalled = true
    }
    
    func onAuthorProfileError(error: RequestError) {
        authorErrorNotifier(error)
    }
    
    func onAuthorPhotosResponse(data: [UserProfilePhoto]) {
        authorPhotosNotifier(data)
    }
    
}
