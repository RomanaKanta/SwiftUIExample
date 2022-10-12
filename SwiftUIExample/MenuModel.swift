//
//  MenuModel.swift
//  SwiftUIExample
//
//  Created by Romana on 12/10/22.
//

import Foundation

class MenuContent: Identifiable, ObservableObject {
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

struct MenuModel {
    let menuHome = MenuContent(id: 1, name: "Home", image: "house.fill")
    let menuProfile = MenuContent(id: 2, name: "Profile", image: "person.fill")
    let menuChat = MenuContent(id: 3, name: "Chat", image: "message.fill")
    let menuLogout = MenuContent(id: 4, name: "Logout", image: "power")
   
    
    func getMenu() -> [MenuContent]{
        return [menuHome, menuProfile, menuChat, menuLogout]
    }
    
}
