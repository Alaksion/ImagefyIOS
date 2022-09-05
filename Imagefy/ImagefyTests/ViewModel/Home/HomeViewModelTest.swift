//
//  HomeViewModelTest.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 01/09/22.
//

import Foundation
@testable import Imagefy
import XCTest

final class HomeViewModelTest: XCTestCase {
    
    private lazy var repository = ImagefyRepositoryMock()
    private lazy var viewModel = HomeViewModel(repository)
    private let delegate = FakeHomeVmDelegate()
    
    func testShouldNotifyDelegateOnGetPhotoSuccess() {
        let expectation = XCTestExpectation(description: "feed photos expectation concluded")
        
        viewModel.delegate = delegate
        delegate.photosNotifier = { expectation.fulfill()}
        
        viewModel.getPhotos()
        
        wait(for: [expectation], timeout: 1)
        
    }
    
    func testShouldNotifyDelegateOnGetPhotosError() {
        let expectation = XCTestExpectation(description: "feed photos expectation concluded")
        repository.feedPhotosResponse = .failure(.noResponse)
        
        viewModel.delegate = delegate
        delegate.photosNotifier = { expectation.fulfill()}
        
        viewModel.getPhotos()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testShouldNotifyDelegateWithNewState() {
        let expectation = XCTestExpectation(description: "feed phtos expectation concluded")
        var newStates: [HomeViewState] = []
        
        viewModel.delegate = delegate
        delegate.photosNotifier = { expectation.fulfill() }
        delegate.photosStateNotifier = { state in
            newStates.append(state)
        }
        
        viewModel.getPhotos()
        
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(HomeViewState.loading, newStates[0])
        XCTAssertEqual(HomeViewState.ready, newStates[1])
    }
    
    func testShouldAppendPhotosToPhotoState() {
        let expectation = XCTestExpectation(description: "feed phtos expectation concluded")
        
        viewModel.delegate = delegate
        delegate.photosNotifier = { expectation.fulfill() }
        
        viewModel.getPhotos()
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertTrue(viewModel.photos.count == 3)
    }
    
    func testShouldAppendPhotosToPhotoStateTwice() {
        let expectation = XCTestExpectation(description: "feed phtos expectation concluded")
        
        viewModel.delegate = delegate
        delegate.photosNotifier = { expectation.fulfill() }
        
        viewModel.getPhotos()
        viewModel.getPhotos()
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertTrue(viewModel.photos.count == 6)
    }
    
}
