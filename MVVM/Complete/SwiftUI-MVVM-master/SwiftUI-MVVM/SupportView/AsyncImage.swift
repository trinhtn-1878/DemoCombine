//
//  AsyncImage.swift
//  SwiftUI-MVVM
//
//  Created by nguyen.the.trinh on 5/18/20.
//  Copyright © 2020 Yusuke Kita. All rights reserved.
//

import SwiftUI

struct AsyncImage: View {
    @ObservedObject private var loader: ImageLoader
    
    
    init(url: URL, cache: ImageCache? = nil) {
        loader = ImageLoader(url: url, cache: cache)
    }
    
    var body: some View {
        image.onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
               Image(uiImage: loader.image!).resizable()
            } else {
                Text("Loading")
            }
        }
    }
    
}
