//
//  ContentView.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/18.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab = "house.fill"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag("house.fill")

                ReelsView()
                    .tag("Reels")

                Text("Liked")
                    .tag("suit.heart")
                
            }
            

            
            HStack {
                ForEach(["house.fill", "Reels", "suit.heart"], id: \.self) { image in
                    Button {
                        withAnimation {currentTab = image}
                    } label: {
                        ZStack {
                            if image == "Reels" {
                                Image(image)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    
                            } else {
                                Image(systemName: image)
                                    .font(.title2)
                            }
                        }
                        .foregroundColor(currentTab == image ? image == "Reels" ? .white : .primary : .gray)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top)
            .overlay(Divider(), alignment: .top)
            .background(currentTab == "Reels" ? .black : .clear)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
