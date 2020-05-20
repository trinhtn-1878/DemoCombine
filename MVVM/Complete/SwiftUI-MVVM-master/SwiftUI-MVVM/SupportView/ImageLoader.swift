//
//  ImageLoader.swift
//  SwiftUI-MVVM
//
//  Created by nguyen.the.trinh on 5/18/20.
//  Copyright © 2020 Yusuke Kita. All rights reserved.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    private let url: URL
    private var cache: ImageCache?
    
    private var isLoading = false
    
    init(url: URL, cache: ImageCache?) {
        self.url = url
        self.cache = cache
    }
    
    func load() {
        if isLoading { return }
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart()},
                          receiveOutput: { [weak self] in self?.cache($0) },
                          receiveCompletion: { [weak self] _ in self?.onFinish()})
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    private func onStart() {
        self.isLoading = true
    }
    
    private func onFinish() {
        self.isLoading = false
    }
    
    private func cache(_ image: UIImage?) {
        cache?[url] = image
    }
}
