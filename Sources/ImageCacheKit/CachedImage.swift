//
//  CachedImage.swift
//  ImageCacheKit
//
//  Created by Shauli Algawi on 04/02/2025.
//

import Foundation
import SwiftData
import UIKit

@Model
public final class CachedImage {
    @Attribute(.unique) public var url: String
    public var imageData: Data
    public var timestamp: Date
    
    public init(url: String, imageData: Data, timestamp: Date) {
        self.url = url
        self.imageData = imageData
        self.timestamp = timestamp
    }
}
