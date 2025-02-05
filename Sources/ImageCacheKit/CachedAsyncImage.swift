//
//  CachedAsyncImage.swift
//  ImageCacheKit
//
//  Created by Shauli Algawi on 04/02/2025.
//

import SwiftUI
import SwiftData

public struct CachedAsyncImage: View {
    @StateObject private var viewModel: CachedAsyncImageViewModel
    let url: URL?
    
    
    
    public init(url: URL?, imageCacheManager: ImageCacheManager) {
        self.url = url
        self._viewModel = StateObject(wrappedValue: CachedAsyncImageViewModel(cachedManager: imageCacheManager))
    }
    
   public var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Color.gray.opacity(0.3)
            }
        }
        .onAppear {
            Task { [weak viewModel] in
                guard let viewModel else {return}
                await viewModel.loadImage(from: url)
            }
        }
    }
}

