//
//  SettingViewModal.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import Foundation

struct SettingViewModal{
    
    let lists: [Setting] = [
        Setting(title: "Notification", image: "bell"),
        Setting(title: "Kids", image: "bell"),
        Setting(title: "TV Guide", image: "tv"),
        Setting(title: "My List", image: "list.triangle"),
        Setting(title: "showmax", image: "airpods.gen3"),
        Setting(title: "My DsTV", image: "person"),
        Setting(title:  "Setting", image: "gear"),
        
    ]
    
}

struct Setting: Identifiable{
    let id = UUID()
    let title: String
    let image: String
}
