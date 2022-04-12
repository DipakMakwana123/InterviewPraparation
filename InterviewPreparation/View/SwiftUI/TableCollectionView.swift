//
//  TableCollectionView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 11/04/22.
//

import SwiftUI

struct TableCollectionView: View {
    let gap: CGFloat = 12
    @State var memes = [Meme]()
    @ObservedObject private  var searchModal =  SearchModal()
    private let viewModal: SwiftUIViewModal = SwiftUIViewModal(apiManager: APIManager())
    
    var body: some View {
        
        
        NavigationView {
            //  setup()
            VStack {
                SearchBar()
                Spacer()
                List {
                    Section(header: Text("Horizontal Rows")) {
                        HorizontalCell(memes: self.memes)
                    }
                    Section(header: Text("Verticle Rows")) {
                        ForEach(memes, id: \.self) { meme in
                            NavigationLink {
                               // DetailView(meme: meme)
                                //LandmarkDetail(landmark: landmark)
                            } label: {
                                HomeListView(memes: meme)
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Home"), displayMode: .automatic)
                .toolbar {
//                    NavigationLink(destination: CollectionView()) {
//                        Text("Help")
//                    }
                    
                }
            }
            .onAppear(){
                // API Call
                viewModal.getMemesData(compilation: {memes in
                    debugPrint(memes)
                    self.memes = memes
                })
                
            }
        }
        .environmentObject(searchModal)
    }
}
struct MyNavigationView: View {
    
    var body: some View {
        
        NavigationView {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
                .navigationBarItems(leading:
                                        Button(action: {
                    print("SF Symbol button pressed...")
                }) {
                    Text("Ds TV")
                        .accentColor(.white)
                },
                trailing:
                    
                    HStack {
                    
                    Button(action: {
                        print("Search Button Pressed")
                    }) {
                        Image(systemName: "antenna.radiowaves.left.and.right.circle")
                        
                    }.accentColor(.white)
                    Button(action: {
                        print("Search Button Pressed")
                    }) {
                        Image(systemName: "magnifyingglass")
                        
                    }.accentColor(.white)
                    
                })
            
        }
    }
}
