//
//  ImageCacheManager.swift
//  ImageCacheKit
//
//  Created by Shauli Algawi on 04/02/2025.
//

import Foundation
import SwiftData
import UIKit

public actor ImageCacheManager: Observable {
    private let modelContext: ModelContext
    
    public init(container: ModelContainer) {
        self.modelContext = ModelContext(container)
    }
    
    public func fetchImage(for url: URL) async -> UIImage? {
        if let cachedImage = try? modelContext.fetch(FetchDescriptor<CachedImage>(predicate: #Predicate {$0.url == url.absoluteString})).first {
            if  let date = Calendar.current.date(byAdding: .hour, value: 24, to: cachedImage.timestamp), date > Date() {
                return UIImage(data: cachedImage.imageData)
            } else {
                modelContext.delete(cachedImage)
            }
        }
        return nil
    }
    
    public func cacheImage(_ image: UIImage, for url: URL) async {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                return
        }
        
        let cachedImage = CachedImage(url: url.absoluteString, imageData: imageData, timestamp: Date())
        modelContext.insert(cachedImage)
    }
    
    public func cleanOldImages() async {
        let oldImages = try? modelContext.fetch(FetchDescriptor<CachedImage>())
        oldImages?.forEach({ image in
            if let date = Calendar.current.date(byAdding: .hour, value: 24, to: image.timestamp), date < Date() {
                modelContext.delete(image)
            }
        })
    }
}
