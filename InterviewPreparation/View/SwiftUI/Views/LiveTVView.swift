//
//  LiveTVView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import SwiftUI

class LiveTVHostingVC: UIHostingController<LiveTVView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
struct LiveTVView: View {
    
    @ObservedObject private var viewModal =  LiveTVViewModal()
    @State var selectedItem: LiveTVModal
    let margin: CGFloat = 8

    var body: some View {
       
            VStack {
                
                HorizontalList(viewModal: viewModal, selectedItem: selectedItem)
                    .padding(margin)
                    .frame( height: 50)
                
                List(viewModal.lists) { item in
                    Text(item.title)
                }
                .listStyle(DefaultListStyle())
                
                //Spacer()
            }
            .navigationBarTitle("Live TV")
    }
    
    private func  resetValue(){
        selectedItem.selected = false
        for var item in viewModal.lists {
            item.selected = false
            if item.id == selectedItem.id {
                item.selected = true
                selectedItem.selected = true
            }
        }
    }
    

}



//struct LiveTVView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveTVView(navigationContoller: UINavigationController())
//    }
//}
