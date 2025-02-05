//
//  File.swift
//  ImageCacheKit
//
//  Created by Shauli Algawi on 04/02/2025.
//


import Foundation
import UIKit
import SwiftUI

public class CachedAsyncImageViewModel: ObservableObject {
    private let cachedManager: ImageCacheManager
    @Published public var image: UIImage?
    public private(set) var isLoading = false
    
    init(cachedManager: ImageCacheManager) {
        self.cachedManager = cachedManager
    }
    
    @MainActor
    public func loadImage(from url: URL?) async {
        guard let url else {
            return
        }
        
        isLoading = true
        
        defer {isLoading = false}
        
        if let cachedImage = await cachedManager.fetchImage(for: url) {
            print("Image Taken from cache")
            self.image = cachedImage
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let downloadedImage = UIImage(data: data) {
                print("Image downloaded")
                self.image = downloadedImage
                await cachedManager.cacheImage(downloadedImage, for: url)
            }
        } catch let error {
            print("Error fetching the image \(error.localizedDescription)")
        }
    }
}
