//
//  HomeViewModelFakeDelegate.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 01/09/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel

final class FakeHomeVmDelegate: HomeViewModelDelegate {
    
    var photosNotifier: (() -> Void) = { }
    var photosStateNotifier: (HomeViewState) -> Void = { state in }
    
    func onResponse(photos: [FeedPhoto]) {
        photosNotifier()
    }
    
    func onError(error: RequestError) {
        photosNotifier()
        
    }
    
    func showNewState(newState: HomeViewState) {
        photosStateNotifier(newState)
    }
    
    
}
