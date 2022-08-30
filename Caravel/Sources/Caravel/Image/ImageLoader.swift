//
//  ImageLoader.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 23/07/22.
//

import Foundation
import UIKit

protocol ImageLoaderProtocol {
    var loadedImages : [URL: UIImage] { get set }
    var runningRequests : [UUID: URLSessionDataTask] { get set }
    
    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID?
    func cancelLoading(_ id: UUID) -> Void
}

final class DefaultImageLoader: ImageLoaderProtocol {
    
    private let cacheSize = 19
    
    static let loader = DefaultImageLoader()
    
    internal var loadedImages: [URL : UIImage] = [ : ]
    
    internal var runningRequests: [UUID : URLSessionDataTask] = [ : ]
    
    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {
        
        // If the image is already loaded, return it
        if let image = loadedImages[url] {
            completion(.success(image))
            debugPrint("Using cached response for \(url.path)")
            return nil
        }
        
        // If the
        let requestId = UUID()
        
        let job = URLSession.shared.dataTask(with: url) {data, response, error in
            defer { self.runningRequests.removeValue(forKey: requestId)}
            
            if let requestData = data, let image = UIImage(data: requestData) {
                self.cacheImage(image: image, url: url)
                completion(.success(image))
                return
            }
            
            guard let requestError = error else {
                // handle error scenario here
                return
            }
            
            guard (requestError as NSError).code == NSURLErrorCancelled else {
                completion(.failure(requestError))
                return
            }

        }
        job.resume()
        
        runningRequests[requestId] = job
        return requestId
    }
    
    func cancelLoading(_ id: UUID) {
        guard let job = runningRequests[id] else { return }
        job.cancel()
        runningRequests.removeValue(forKey: id)
    }
    
    // To save resources the cache size is limited, when the cache's limit is reached
    // the first image is replaced by the most recent.
    private func cacheImage(image: UIImage, url: URL) {
        if loadedImages.count > cacheSize {
            for firstImage in loadedImages.keys {
                debugPrint("\(firstImage.path) removed from cache")
                loadedImages[firstImage] = nil
                loadedImages[url] = image
                return
            }
        } else {
            loadedImages[url] = image
        }
        debugPrint("\(url.path) stored in cache")
    }
    
}
