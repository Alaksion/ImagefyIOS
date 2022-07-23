//
//  UIImageLoader.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/07/22.
//

import Foundation
import UIKit

protocol UIImageLoaderProtocol {
    func load(from url: URL, to imageView: UIImageView)
    func cancelLoad(from : UIImageView)
}

final class UIImageLoader: UIImageLoaderProtocol {
    static let loader = UIImageLoader()
    
    private let imageLoader = DefaultImageLoader()
    private var requestIds: [UIImageView: UUID] = [ : ]
    
    private init() {}
    
    func load(from url: URL, to imageView: UIImageView) {
        let token = imageLoader.loadImage(url) { result in
            defer { self.requestIds.removeValue(forKey: imageView)}
            
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } catch {
                imageView.backgroundColor = .red
            }
        }
        
        if let requestToken = token {
            requestIds[imageView] = requestToken
        }
    }
    
    func cancelLoad(from imageView: UIImageView) {
        if let uuid = requestIds[imageView] {
            imageLoader.cancelLoading(uuid)
            requestIds.removeValue(forKey: imageView)
          }
    }
}
