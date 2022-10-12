//
//  LoginView.swift
//  SwiftUIExample
//
//  Created by Romana on 10/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var session = Session()
   
    var body: some View {
        if session.authenticated{
            HomeView(session: self.session)
        }else{
            ZStack{
                Image("sky")
                    .resizable()
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("Log in")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .medium, design: .rounded))
                    TextField("Username", text: $session.username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $session.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    HStack{
                        Toggle("", isOn: $session.checked)
                            .toggleStyle(
                            CheckboxToggleStyle( title: "Remember Me")
                        )
                        Spacer()
                        Button("Forgot Password?", action: session.logPressed)
                            .tint(.red.opacity(0.8))
                        Spacer()
                       
                    }
                    Button("Log in", action: loginPressed)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(.blue.opacity(0.5))
                        .tint(.black)
                        .cornerRadius(10)
                        .padding()
                    Spacer()
                }
                .alert("Access denied", isPresented: $session.invalid) {
                    Button("Dismiss", action: session.logPressed)
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.scale)
        }
    }
    
    func loginPressed(){
        session.login()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
