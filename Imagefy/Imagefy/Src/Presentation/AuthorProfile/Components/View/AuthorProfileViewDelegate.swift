//
//  AuthorProfileViewDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/08/22.
//

import Foundation

protocol AuthorProfileViewDelegate {
    func loadMorePhotos()
    func onPhotoCellClick(withId id: String)
}
