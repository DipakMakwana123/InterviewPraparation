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
    @State var selectedSection: LiveTVModal?
    let margin: CGFloat = 8
   // @State var sliderValue: CGFloat = 0.7
    
   // let listData: [ItemData] = [.FirstData, .SecondData, .ThirdData]
    
    var body: some View {
       
            VStack {
                HorizontalList(viewModal: viewModal, selectedItem: selectedItem)
                    .frame( height: 40)
               
                ScrollView() {
                        ForEach(viewModal.lists,id:\.id) { item in
                            Button(action: {
                                
                                if selectedSection == nil {
                                    selectedSection = item
                                    selectedSection?.selected = true
                                }else {
                                    selectedSection = nil
                                }
                              
                                
                                
                              //  resetValue()
                                
                            }, label: {
                                VStack {
                                    HStack {
                                        SectionHeaderWithArrow(strTitle: item.title)
                                            .padding(margin)
                                        Spacer()
                                    }
                                    Divider()
                                 }
                            })
                            if let selectedItem = selectedSection,selectedItem.id == item.id,selectedItem.selected,let list = selectedItem.subItems   {
                                    
                                    ForEach(list) { subItem in
                                        VStack {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    LogoImageView()
                                                    .padding(margin)
                                                    TextLabel(strTitle: "101")
                                                        .padding(margin)
                                                    Spacer()
                                                }.frame(width: 100)
                                                
                                            VStack (alignment: .leading){
                                                TextLabel(strTitle: subItem.title)
                                                        .padding(margin/2)
                                                PlayerProgressView()
                                                PlayerView()
                                                TextLabel(strTitle: "Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum")
                                                    .padding(margin)
                                            }
                                        }
                                        Divider()
                                    }
                                    .background(Color.black)
                                    .accentColor(Color.white)
                                }
                        }
                        
                        }
                }
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

struct CellView: View {
    var item: ItemData
    
    var body: some View {
        HStack {
           // Image.init(uiImage: item.image)
            Text(item.name)
        }
    }
}
struct PlayerView: View {
    var body: some View {
        Rectangle()
            .fill()
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .frame(height: 150)
            
    }
}

struct PlayerProgressView: View{
    var body: some View {
        ProgressView("",value:0.7,total:1.0)
            .accentColor(Color.blue)
            
    }
}
struct LogoImageView: View {
    var body: some View {
        HStack {
            Image("sample-logo")
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode:.fit)
            Spacer()
        }
    }
}

//struct LiveTVView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveTVView(navigationContoller: UINavigationController())
//    }
//}
