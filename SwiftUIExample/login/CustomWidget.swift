//
//  CustomWidget.swift
//  SwiftUIExample
//
//  Created by Romana on 10/10/22.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    var title: String
    var color: Color = .black
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Button{
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square": "square")
            }
            .tint(color)
            
        Text(title)
         .foregroundColor(color)
        }
        
        
       
    }
}
