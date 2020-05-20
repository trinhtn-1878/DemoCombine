//
//  EnvironmentImageCache.swift
//  SwiftUI-MVVM
//
//  Created by nguyen.the.trinh on 5/20/20.
//  Copyright © 2020 Yusuke Kita. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
