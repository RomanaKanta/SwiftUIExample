//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Romana on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuContent] = MenuModel().getMenu()
    @State var menuItemSelected: MenuContent = MenuModel().getMenu()[0]
    var body: some View {
        ZStack {
            List(menu) { menuItem in
                MenuCell(menuItem: menuItem)
                    .onTapGesture {
                        self.menuItemSelected = menuItem
                   }
            }
            self.selected(Menu: menuItemSelected)
        }
    }
    
    
    func selected(Menu: MenuContent) -> some View {
        switch Menu.name {
        case "Home":
            return AnyView(OtherView(title: "Home"))
            
        case "Profile":
            return AnyView(OtherView(title: "Profile"))
            
        case "Chat":
            return AnyView(OtherView(title: "Chat"))
            
        case "Logout":
            return AnyView(OtherView(title: "Logout"))
        default:
            return AnyView(OtherView(title: "Home"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(menu: MenuModel().getMenu())
    }
}


struct MenuCell: View {
    var menuItem: MenuContent = MenuModel().getMenu()[0]
    var body: some View {
        HStack {
            Image(systemName: menuItem.image)
                .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            Text(menuItem.name).foregroundColor(.orange)
        }
    }
}
