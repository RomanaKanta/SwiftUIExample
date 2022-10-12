//
//  GalleryView.swift
//  SwiftUIExample
//
//  Created by Romana on 11/10/22.
//

import SwiftUI

struct GalleryView: View {
    @State private var isSideBarOpened = false
        
        var body: some View {
            ZStack {
                NavigationView {
                    GeometryReader { dimensions in
                        List {
                            ForEach(0..<8) { _ in
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 240)
                                } placeholder: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.gray.opacity(0.6))
                                            .frame(height: 240)
                                        ProgressView()
                                    }
                                }
                                .aspectRatio(3 / 2, contentMode: .fit)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                            }
                        }
                        .toolbar {
                            Button(role: ButtonRole.destructive) {
                                isSideBarOpened.toggle()
                            } label: {
                                Label("Toggle SideBar", systemImage: "line.3.horizontal.circle.fill")
                            }
                        }
                        .listStyle(.inset)
                        .navigationTitle("Gallery")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
                SideMenu(isSidebarVisible: $isSideBarOpened)
            }
        }
    }

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
