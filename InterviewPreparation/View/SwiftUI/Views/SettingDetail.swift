//
//  SettingDetail.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingDetail: View {
    private let viewModal: SettingDetailViewModal = SettingDetailViewModal()
    let margin: CGFloat = 8
    @State var isToggle: Bool = false
    
    var body: some View {
        Form {
            
            ForEach(viewModal.lists,id:\.id) {item in
                SectionHeader(strTitle: item.title ?? "")
                    ForEach(item.lists,id:\.id) {subItem in
                        SettingToggleView(subItem:subItem, isToggle: $isToggle)
                    }
            
            }
        }
    }
}

struct SectionHeader: View {
    var strTitle: String
    
    var body: some View {
        Text(strTitle)
            .foregroundColor(Color.blue)
            .font(.body)
            .fontWeight(.regular)
    }
}

//struct SettingDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingDetail()
//    }
//}
