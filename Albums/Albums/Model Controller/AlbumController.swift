//
//  AlbumController.swift
//  Albums
//
//  Created by Niranjan Kumar on 12/2/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class AlbumController {
    
    var albums = [Album]()
    var baseURL = URL(string: "https://albums-48d36.firebaseio.com/")!
    
    // MARK: - Networking

    
    
    
    // MARK: - Example Tests

    func testDecodingExampleAlbum() {
        if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Album.self, from: data)
                testEncodingExampleAlbum(data: jsonData)
            } catch {
                print("Error decoding data")
            }
        }
    }

    func testEncodingExampleAlbum(data: Album) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
//            encoder.outputFormatting = .withoutEscapingSlashes
            let jsonData = try encoder.encode(data)
            if let jsonDataString = String(data: jsonData, encoding: .utf8) {
                print("important stuff: \n\(jsonDataString)")
            }
        } catch {
            print("Error encoding data")
        }
    }
}
