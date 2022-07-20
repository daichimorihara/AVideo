//
//  Reel.swift
//  AVideo
//
//  Created by Daichi Morihara on 2022/07/20.
//

import Foundation
import AVKit

struct Reel: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
