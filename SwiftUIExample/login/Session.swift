//
//  Session.swift
//  SwiftUIExample
//
//  Created by Romana on 10/10/22.
//

import Foundation
import SwiftUI

    class Session: ObservableObject {
        @Published var authenticated = false {
            willSet {objectWillChange.send()}
        }
        @AppStorage("USER_KEY") var storedUsername = ""
        
        @Published var username = "user"
        @Published var password = "password"
        @Published var invalid: Bool = false
        @Published var checked = false
        
        init() {
            print("Current logged on: \(authenticated)")
            print("Current user: \(storedUsername)")
            
            if(!storedUsername.isEmpty){
                checked = true
                username = storedUsername
            }
        }
        
        func saveUser(){
            if checked {
                storedUsername = username
            }else{
                storedUsername = ""
            }
        }
        
        func toggleAuthentication(){
            self.password = ""
            withAnimation {
                authenticated.toggle()
            }
        }
        
        func authenticate(){
            guard self.username == "user" else {
                self.invalid = true
                return
            }

            guard self.password == "password" else {
                self.invalid = true
                return
            }
            toggleAuthentication()
        }
        
        func login(){
            saveUser()
            authenticate()
        }
        
        func logOut(){
            toggleAuthentication()
        }
        
        func logPressed(){
            print("Button pressed.")
        }
    }
