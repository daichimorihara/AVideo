//
//  PreviewProvider.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/18.
//

import Foundation
import SwiftUI
import AVFoundation

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let video = Video(id: 1448735, url: "https://www.pexels.com/video/video-of-forest-1448735/", image: "https://images.pexels.com/videos/1448735/free-video-1448735.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb", duration: 31, user: User(id: 873, name: "David Paul", url: "https://www.pexels.com/@digitech"), videoFiles: [VideoFile(id: 33, quality: "", fileType: "", link: "https://player.vimeo.com/external/291648067.sd.mp4?s=7f9ee1f8ec1e5376027e4a6d1d05d5738b2fbb29&profile_id=164&oauth2_token_id=57447761")])
    
    let reel = Reel(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Reel1", ofType: "mp4")!)), mediaFile: MediaFile(url: "Reel1", title: "Apple AirTag....."))
}
//{
//    "id": 1448735,
//    "url": "https://www.pexels.com/video/video-of-forest-1448735/",
//    "image": "https://images.pexels.com/videos/1448735/free-video-1448735.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb",
//    "duration": 32,
//    "user": {
//        "id": 574687,
//        "name": "Ruvim Miksanskiy",
//        "url": "https://www.pexels.com/@digitech"
//    },
//    "video_files": [
//        {
//            "id": 58649,
//            "quality": "sd",
//            "file_type": "video/mp4",
//            "width": 640,
//            "height": 338,
//            "link": "https://player.vimeo.com/external/291648067.sd.mp4?s=7f9ee1f8ec1e5376027e4a6d1d05d5738b2fbb29&profile_id=164&oauth2_token_id=57447761"
//        },
//        {
//            "id": 58650,
//            "quality": "hd",
//            "file_type": "video/mp4",
//            "width": 2048,
//            "height": 1080,
//            "link": "https://player.vimeo.com/external/291648067.hd.mp4?s=94998971682c6a3267e4cbd19d16a7b6c720f345&profile_id=175&oauth2_token_id=57447761"
//        },
//        {
//            "id": 58651,
//            "quality": "hd",
//            "file_type": "video/mp4",
//            "width": 4096,
//            "height": 2160,
//            "link": "https://player.vimeo.com/external/291648067.hd.mp4?s=94998971682c6a3267e4cbd19d16a7b6c720f345&profile_id=172&oauth2_token_id=57447761"
//        }
//    ]
//}
