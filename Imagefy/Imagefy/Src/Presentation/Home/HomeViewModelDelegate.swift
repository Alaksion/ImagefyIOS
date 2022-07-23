//
//  HomeViewModelDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/07/22.
//

import Foundation

protocol HomeViewModelDelegate {
    
    func onResponse()
    func onError(error: RequestError)
    
}
