//
//  OtherView.swift
//  SwiftUIExample
//
//  Created by Romana on 11/10/22.
//

import SwiftUI

struct OtherView: View {
    var title: String
    @State private var showingMenu = false
    var body: some View {
        ZStack {
                   
                   Color.red.edgesIgnoringSafeArea(
                       .all)
                   VStack(alignment: .leading) {
                       Button(action: {
                           withAnimation(.easeInOut(duration: 0.5)) {
                               self.showingMenu.toggle()
                                           }
                           
                       }) {
                           Image(systemName: "line.horizontal.3")
                               .foregroundColor(.white)
                       }
                       .frame(width: 50.0, height: 50.0)
                       Spacer()
                       Text(title)
                           .font(
                               .largeTitle)
                           .foregroundColor(
                               .white)
                           .frame(maxWidth: .infinity)
                       Spacer()
                   }.padding(.horizontal) .frame(maxWidth: .infinity)
               }
               .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
               
        
           }
       }

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView(title: "")
    }
}
