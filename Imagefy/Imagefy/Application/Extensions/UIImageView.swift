//
//  UIImageView.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/07/22.
//

import Foundation
import UIKit
import Caravel

extension UIImageView {
    
    func loadImage(from value: String) {
        guard let url = URL(string: value) else {return}
        UIImageLoader.loader.load(from: url, to: self)
    }
    
    func cancelLoading() {
        UIImageLoader.loader.cancelLoad(from: self)
    }
        
}
