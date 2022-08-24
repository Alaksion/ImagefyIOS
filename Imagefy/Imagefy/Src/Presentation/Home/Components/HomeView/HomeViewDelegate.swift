//
//  HomeViewDelegate.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 24/08/22.
//

import Foundation

protocol HomeViewDelegate {
    func onProfileHeaderClicked(withUsername username: String)
    func onReachEndOfList()
}
