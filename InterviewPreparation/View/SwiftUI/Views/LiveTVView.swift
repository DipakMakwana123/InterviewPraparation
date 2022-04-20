//
//  LiveTVView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import SwiftUI

class LiveTVHostingVC: UIHostingController<LiveTVView> {
    
//    override func viewDidLoad() {
//        self.title = "12212121212"
//        self.tabBarController?.tabBar.isHidden = true
//    }
}


struct LiveTVView: View {
    
    @ObservedObject private var viewModal =  LiveTVViewModal()
    @State var selectedItem: LiveTVModal
    

    var body: some View {
       
            VStack {
               // CustomSegmentControlView(viewModal: viewModal, selectedItem: LiveTVModal(selected: false))
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModal.lists,id:\.id) {  item in
        
                           // TextCell(item: selectedItem, selectedItem: selectedItem, lists: viewModal.lists)
                            Button(action: {
                               // item.selected = true
                                selectedItem = item

                                resetValue()

                            }, label: {
                                VStack {
                                    Text(item.title)
                                        .padding(4)
                                        .background(Color.black)
                                        .foregroundColor(Color.white)
                                    if item.id == selectedItem.id {
                                        Divider()
                                            .frame(height:5)
                                            .background(Color.red)
                                    }
                                    Spacer()
                                }
                                .padding(8)
                            })
//                                .onAppear{
//                                    selectedItem = item
//                                }
                        }
                    }
                }
                Spacer()
            }
           // .environment(viewModal)
            .navigationBarTitle("New Navigation Title")
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
