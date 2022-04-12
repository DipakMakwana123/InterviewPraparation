//
//  HorizontalCell.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct HorizontalCell: View {
    var memes : [Meme]
    @State var viewFrame: CGSize = .zero
    
    var body: some View {
       
        
        ScrollView(.horizontal, content: {
            
            HStack(spacing: 15) {
//                GeometryReader { (geometry) in
//                                self.makeView(geometry)
//                    }
            ForEach(memes, id: \.self) { meme in
                NavigationLink {
                  //  DetailView(meme: meme)
                } label: {
                    VStack {
                        Text(meme.name ?? "")
                        Spacer()
                        AsyncImageView(urlString:meme.url)
                    }
                }
             }
            }
            
        }).frame(width:414, height: 200, alignment: .center)
            
            
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
           print(geometry.size.width, geometry.size.height)

           DispatchQueue.main.async { viewFrame = geometry.size }
            print(viewFrame.width, viewFrame.height)
           return Text("qdlfld/fklfldfjldkjfljfldfjldsfjjfldjfldsjfldjfldjfdlfjldkjfldkfjdlkfjldsjfdlskfjdlfjdlskfjdlsfjdlkfjdslkfjdslkfjdslkfjdlksfjdlksfjdslkfdlksjfdklsfjdklsfjdlkfjdsklfjdslkfjr")
                   .frame(width: geometry.size.width)
       }
    

}

 
