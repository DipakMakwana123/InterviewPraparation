//
//  AsyncImageView.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct AsyncImageView: View {
    var urlString : String = ""
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: urlString),
                       content: { image in
                // image.background(.red)
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            },
                       placeholder: {
                ProgressView()
            }).background(.red)
        } else {
            // Fallback on earlier versions
        }
    }
}
