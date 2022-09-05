//
//  PostDetailsViewModelTest.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 30/08/22.
//

import XCTest
@testable import Imagefy

class PostDetailsViewModelTest: XCTestCase {
    
    private lazy var repository = ImagefyRepositoryMock()
    private lazy var viewModel = PostDetailsViewModel(
        repository,
        forPostWithId: ""
    )
    private lazy var delegate = PostDetailsVMFakeDelegate()

    func testShouldCallDelegateWithDataWhenGetPostDetailSucceeds() {
        let expectation = XCTestExpectation(description: "async finished")
        
        viewModel.delegate = delegate
        delegate.notifyFullfill = { expectation.fulfill() }
        
        viewModel.getPostDetails()
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertTrue(delegate.onSuccessReceived)
    }
    
    func testShouldCallDelegateWithErrorWhenGetPostFails() {
        repository.photoDetailsReturnsSuccess = false
        let expectaction = XCTestExpectation(description: "async finished")
        
        viewModel.delegate = delegate
        delegate.notifyFullfill = { expectaction.fulfill() }
        
        viewModel.getPostDetails()
        
        wait(for: [expectaction], timeout: 1)
        
        XCTAssertTrue(delegate.onErrorReceived)
        
    }

}
