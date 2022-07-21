//
//  ReelsPlayer.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/20.
//

import SwiftUI

struct ReelsPlayer: View {
    //@Binding var reel: Reel
    //@Binding var currentReel: String
    @Binding var currentReel: String
    let reel: Reel
    
    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                
                GeometryReader { geometry -> Color in
                    let minY = geometry.frame(in: .global).minY
                    
                    let size = geometry.size
                    
                    DispatchQueue.main.async {
                        if -minY < (size.height/2) && minY < (size.height/2) && currentReel == reel.id {
                            player.play()
                        } else {
                            player.seek(to: .zero)
                            player.pause()
                        }
                                
                    }
                    return Color.clear  
                }
            }
        }
        .onDisappear {
            if let player = reel.player {
                player.pause()
            }
        }
    }
}

struct ReelsPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ReelsPlayer(currentReel: .constant(""), reel: reelEx)
    }
}
