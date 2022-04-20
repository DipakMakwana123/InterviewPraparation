//
//  LiveTVViewModal.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import Foundation

class LiveTVViewModal: ObservableObject{
    
    @Published var selectedItem =  LiveTVModal(selected: false)
    
    @Published var lists: [LiveTVModal] = [
        
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels",selected: false,lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels",  selected: false,lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels",  selected: false,lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, lists: [
            VideoList(title: "Origins", time: "11:30 : 12:00", minutes: "200"),
            VideoList(title: "Sports", time: "11:30 : 12:00", minutes: "203"),
        ])

    ]
}


struct LiveTVModal: Identifiable {
    var id = UUID()
    var title: String
    var selected: Bool
    var lists: [VideoList]
    
    init(id: UUID = UUID(),title:String = String() , selected:Bool,lists:[VideoList] = []){
        self.id = id
        self.title = title
        self.selected = selected
        self.lists = lists
    }
}

struct VideoList: Identifiable{
    let id = UUID()
    let title: String
    let time: String
    let minutes: String
}
