//
//  MediaFIle.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/20.
//

import Foundation
import AVFoundation

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded = false
}

var filesJSON = [
    MediaFile(url: "Reel1", title: "Apple AirTag....."),
    MediaFile(url: "Reel2", title: "omg..... Animal crossing"),
    MediaFile(url: "Reel3", title: "So hyped for Halo...."),
    MediaFile(url: "Reel4", title: "SponsorShip....."),
    MediaFile(url: "Reel5", title: "I've been creating more vertical 30 second content"),
    MediaFile(url: "Reel6", title: "The brand new Apple Tower Theater opens")
]

let pathEx = Bundle.main.path(forResource: "Reel1", ofType: "mp4") ?? ""
let reelEx = Reel(player: AVPlayer(url: URL(fileURLWithPath: pathEx)), mediaFile: MediaFile(url: "Reel1", title: "Apple AirTag....."))
