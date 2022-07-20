//
//  VideoCard.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import SwiftUI

struct VideoCard: View {
    
    let video: Video
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: video.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                    
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                }

                VStack(alignment: .leading) {
                    Text("\(video.duration) sec")
                        .font(.caption)
                    
                    Text("By \(video.user.name)")
                        .font(.caption)
                }
                .foregroundColor(.white)
                .padding()
            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(100)
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(video: dev.video)
    }
}
