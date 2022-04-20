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
    
    var navigationContoller: UINavigationController
    
    private let viewModal =  LiveTVViewModal()
    
    var body: some View {
       
            VStack {
                CustomSegmentControlView(viewModal: viewModal, selectedItem: LiveTVModal(selected: false))
                Spacer()
            }
            .navigationBarTitle("New Navigation Title")
    }
}

//struct LiveTVView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveTVView(navigationContoller: UINavigationController())
//    }
//}
