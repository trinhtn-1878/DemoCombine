//
//  RepositoryListRow.swift
//  SwiftUI-MVVM
//
//  Created by Yusuke Kita on 6/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositoryListRow: View {

    @State var repository: Repository
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        NavigationLink(destination: RepositoryDetailView(viewModel: .init(repository: repository))) {
            HStack {
                AsyncImage(url: repository.owner.avatarUrl, cache: self.cache)
                    .frame(width: 50, height: 50)
                 Text(repository.fullName)
            }
           
        }
    }
}

#if DEBUG
struct RepositoryListRow_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListRow(repository:
            Repository(
                id: 1,
                fullName: "Swift UI",
                owner: User(id: 1, login: "bar", avatarUrl: URL(string: "baz")!)
            )
        )
            .previewLayout(.fixed(width: 250, height: 50))
    }
}
#endif
