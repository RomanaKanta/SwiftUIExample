//
//  MainView.swift
//  SwiftUIExample
//
//  Created by Romana on 12/10/22.
//

import SwiftUI

struct MainContent: View {
    @State var showMenu: Bool = false
    var body: some View {

        let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }
        NavigationView {
            
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                MainView(showMenu: $showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    .disabled(self.showMenu ? true : false)
                if showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/2, height: geometry.size.height, alignment: .leading)
                        .transition(.move(edge: .leading))
                }
            }
            .gesture(drag)
        }
        .navigationBarTitle("Side Menu", displayMode: .inline)
        .navigationBarItems(leading: (
                            Button(action: {
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                            }
                        ))
    }

    }
}

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            ForEach(MenuModel().getMenu()) { item in
                HStack {
                    Image(systemName: item.image)
                        .foregroundColor(.black)
                        .imageScale(.large)
                    Text(item.name)
                        .foregroundColor(.black)
                        .font(.headline)
                        }
            }
            Spacer()
           
        }
        .padding(.top, 120)
        .padding(.leading, 30)

        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.mint)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    var body: some View {
        Button {
            withAnimation {
                showMenu = true
            }
        } label: {
            Text("Show Menu")
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainContent()
    }
}
