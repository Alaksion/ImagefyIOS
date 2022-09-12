//
//  AuthorProfileViewModelTest.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 04/09/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel
import XCTest

final class AuthorProfileViewModelTest: XCTestCase {
    
    private let repository = ImagefyRepositoryMock()
    private lazy var viewModel = AuthorProfileViewModel(repository: repository)
    private let delegate = AuthorProfileVmFakeDelegate()
    
    override func setUp() {
        viewModel.delegate = delegate
    }
    
    func testShouldNotifyDelegateWhenGetProfileSucceeds() {
        let expectation = XCTestExpectation(description: "get profile concluded")
        
        delegate.completionObserver = { expectation.fulfill() }
        
        viewModel.getAuthorProfile(with: "username")
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertTrue(delegate.authorProfileCalled)
    }
    
    func testShouldNotifyDelegateWithError() {
        let expectation = XCTestExpectation(description: "get profile concluded")
        var receivedError: RequestError?
        repository.getUserProfileResponse = .failure(RequestError.noResponse)
    
        delegate.authorErrorNotifier = { error in
            receivedError = error
            expectation.fulfill()
        }
        
        viewModel.getAuthorProfile(with: "user")
        wait(for: [expectation], timeout: 1)
        
        XCTAssertTrue(receivedError == RequestError.noResponse)
        
    }
    
    func testShouldNotifyDelegateOnGetProfilePhotos() {
        let expectation = XCTestExpectation(description: "get profile photos concluded")
        var receivedPhotos: [UserProfilePhoto] = []
        delegate.authorPhotosNotifier = { photos in
            expectation.fulfill()
            receivedPhotos = photos
        }
        
        viewModel.getAuthorPhotos(with: "name")
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedPhotos.count, RepositoryTestData.userProfilePhotos.count)
    }
    
}
