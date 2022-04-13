//
//  SettingView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import SwiftUI

struct SettingView: View {
    private let viewModal: SettingViewModal = SettingViewModal()
    
    let backgroundColor: Color = Color.black.opacity(1)
    
    init(){
            
        }
    var body: some View {

        NavigationView {
                VStack {
                    VStack{
                    HStack {
                        
                        ForEach((1...3),id:\.self) { _ in
                            VStack {
                                HStack {
                                    Image(systemName: "face.smiling.fill")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 100, height: 100)
                                .background(Color.red)
                                .cornerRadius(10)
                                Text("John")
                                .foregroundColor(.white)
                                
                            }
                        }
                    }
                    HStack {
                            Image(systemName: "pencil.circle")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                
                                .padding()
                            Text("Edit Profile")
                                .foregroundColor(.white)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.clear)
                        .accentColor(.white)
                    }
                    
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                    .background(backgroundColor)
                    Divider()
                        .frame( height: 1)
                    
                    ///
                    Form {
                        VStack {
                           
                            ForEach(viewModal.lists, id: \.id) { result in
                                HStack {
                                    Image(systemName: result.image)
                                        .padding()
                                    Text(result.title)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                    .foregroundColor(Color.white)
                    .background(Color.black)
                }
                .navigationTitle("More")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
            }
        }
  
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
