//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by Romana on 10/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var session: Session
    var serviceConsumer = ServiceConsumer()
    @State  var users: [User] = []
    @State var menuOpen: Bool = false
        
    var body: some View {
        VStack{
            HStack{
                Button {
                    menuOpen.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
                .padding()
                .tint(.black)


                Spacer()
                Text("Welcome back **\(session.username)**")
                Spacer()
                
                    Button {
                        menuOpen.toggle()
                    } label: {
                        Image(systemName: "bell")
                    }
                    .tint(.black)
                    .padding()

            }.background(.green)
            Text("**Author List**")
        ScrollView {


                    VStack(alignment: .leading) {
                        ForEach(self.users) { user in
                            HStack(alignment:.top) {
                                Text("\(user.id)")

                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .bold()

                                    Text(user.email.lowercased())

                                    Text(user.phone)
                                }
                            }
                            .frame(width: 300, alignment: .leading)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                            .cornerRadius(20)
                        }
                    }

                }
                .padding(.vertical)
                .onAppear() {
                    serviceConsumer.loadData { (users) in
                                    self.users = users
                        print("cunt \(self.users.count)")
                                }
                            }
            
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(session: Session())
    }
}


