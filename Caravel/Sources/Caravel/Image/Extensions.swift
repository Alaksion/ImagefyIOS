//
//  File.swift
//  
//
//  Created by Lucca Beurmann on 30/08/22.
//

import Foundation
import UIKit

public extension UIImageView {
    
    func loadImage(from value: String) {
        guard let url = URL(string: value) else {return}
        UIImageLoader.loader.load(from: url, to: self)
    }
    
    func cancelLoading() {
        UIImageLoader.loader.cancelLoad(from: self)
    }
    
}
