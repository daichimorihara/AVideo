//
//  VideoManager.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import Foundation

class VideoManager {
    
    func fetchVideos(topic: Query) async throws -> [Video] {
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic.rawValue)&orientation=portrait") else {
            print("0")
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("563492ad6f91700001000001255786f52d964e38a531f088b37ac755", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("1")
                throw URLError(.badServerResponse)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let videos = try decoder.decode(VideoResponse.self, from: data).videos
            print(videos)
            return videos
        } catch  {
            print("2")
            throw error
        }
        
        
    }
}
