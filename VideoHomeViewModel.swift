//
//  VideoHomeViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import Foundation

@MainActor
class VideoHomeViewModel: ObservableObject {
    @Published var videos = [Video]()
    @Published var selectedQuery: Query = .nature {
        didSet {
            Task {
                await fetchVideos(topic: selectedQuery)
            }
        }
    }
    
    init() {
        Task {
            await fetchVideos(topic: selectedQuery)
        }
    }

    let manager = VideoManager()
    
    func fetchVideos(topic: Query) async {
        if let returnedVideo = try? await manager.fetchVideos(topic: topic) {
            videos = returnedVideo
        }
    }

}



