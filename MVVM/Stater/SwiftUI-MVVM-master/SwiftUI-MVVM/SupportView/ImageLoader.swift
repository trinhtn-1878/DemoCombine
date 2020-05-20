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
    
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        
    }
}
