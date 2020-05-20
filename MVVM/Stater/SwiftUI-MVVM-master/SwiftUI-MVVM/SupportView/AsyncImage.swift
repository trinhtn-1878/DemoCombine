//
//  AsyncImage.swift
//  SwiftUI-MVVM
//
//  Created by nguyen.the.trinh on 5/18/20.
//  Copyright © 2020 Yusuke Kita. All rights reserved.
//

import SwiftUI

struct AsyncImage: View {
    
    init() {
    }
    
    var body: some View {
        image
    }
    
    private var image: some View {
        Text("Loading")
    }
}
