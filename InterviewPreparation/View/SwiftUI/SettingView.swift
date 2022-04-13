//
//  SettingView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import SwiftUI

struct SettingView: View {
    private let viewModal: SettingViewModal = SettingViewModal()
    var body: some View {
     
            NavigationView {
                Form {
                    VStack {
                       
                        ForEach(viewModal.lists, id: \.id) { result in
                            HStack {
                                Image(systemName: result.image)
                                    
                                    .accentColor(.white)
                                    .padding()
                                Text(result.title)
                                
                                Spacer()
                            }
                            Divider()
                        }
                    }
                    
                }
                .navigationTitle("More")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
  
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
