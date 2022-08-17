//
//  PostDetailsVmDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 17/08/22.
//

import Foundation

protocol PostDetailsVmDelegate {
    func onSuccess(data: PhotoDetails)
    func onError(error: RequestError)
}
