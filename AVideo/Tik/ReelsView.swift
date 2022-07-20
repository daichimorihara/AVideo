//
//  ReelsView.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/20.
//

import SwiftUI
import CoreMIDI
import AVFoundation

struct ReelsView: View {
    @State private var currentReel = ""
    
    @State private var reels = filesJSON.map { item -> Reel in
        let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        return Reel(player: player, mediaFile: item)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            TabView(selection: $currentReel) {
                ForEach($reels) { $reel in
                    ReelsPlayer(reel: $reel, currentReel: $currentReel)
                    .frame(width: size.width)
                    .background(.red)
                    .rotationEffect(.init(degrees: -90))

                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
            
            
        }
        .onAppear {
            currentReel = reels.first?.id ?? ""
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}



