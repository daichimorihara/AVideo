//
//  MockData.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import Foundation

//var previewVideo: Video = loadddd("data")

func loadddd<T: Decodable>(_ filename: String) -> T {
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError()
    }
    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError()
    }
}
