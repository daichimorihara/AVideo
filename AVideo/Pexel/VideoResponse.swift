//
//  VideoResponse.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//
// apikey 563492ad6f91700001000001255786f52d964e38a531f088b37ac755

import Foundation

struct VideoResponse: Decodable {
    let page: Int
    let perPage: Int
    let totalResults: Int
    let url: String
    let videos: [Video]
}

// MARK: - Video
struct Video: Decodable, Identifiable {
    let id: Int
    let url: String
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]
}

// MARK: - User
struct User: Decodable {
    let id: Int
    let name: String
    let url: String
}

// MARK: - VideoFile
struct VideoFile: Decodable {
    let id: Int
    let quality, fileType: String
    let link: String
}


enum Query: String, CaseIterable {
    case nature, animals, people, ocean, food
}


