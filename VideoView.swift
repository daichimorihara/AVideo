//
//  VideoView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import SwiftUI
import AVKit

struct VideoLoadingView: View {
    @Binding var video: Video?
    
    var body: some View {
        ZStack {
            if let video = video {
                VideoView(video: video)
            }
        }
    }
}

struct VideoView: View {
    let video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link = video.videoFiles.first?.link,
                   let url = URL(string: link)
                {
                    player = AVPlayer(url: url)
                    
                    player.play()
                }
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: dev.video)
    }
}
