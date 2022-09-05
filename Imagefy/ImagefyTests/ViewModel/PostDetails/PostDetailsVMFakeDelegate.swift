//
//  PostDetailsVMFakeDelegate.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 30/08/22.
//

import Foundation
@testable import Imagefy
@testable import Caravel

final class PostDetailsVMFakeDelegate: PostDetailsVmDelegate {
    
    var onSuccessReceived = false
    var onErrorReceived = false
    var notifyFullfill: (() -> Void)?
    
    func onSuccess(data: PhotoDetails) {
        onSuccessReceived = true
        guard let notifier = notifyFullfill else { return }
        notifier()
    }
    
    func onError(error: RequestError) {
        onErrorReceived = true
        guard let notifier = notifyFullfill else { return }
        notifier()
    }
    
}
