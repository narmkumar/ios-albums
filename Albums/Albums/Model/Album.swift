//
//  Album.swift
//  Albums
//
//  Created by Niranjan Kumar on 12/2/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import Foundation

struct Album: Codable {
    let artist: String
    let coverArt: [URL]
    let genres: [String]
    let id: String
    let name: String
    let songs: [Song]

    enum AlbumKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs

        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumKeys.self)

        self.artist = try container.decode(String.self, forKey: .artist)

        var coverArts: [URL] = []
        var coverArtsContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        while coverArtsContainer.isAtEnd == false {
            let urlContainer = try coverArtsContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
            let url = try urlContainer.decode(URL.self, forKey: .url)
            coverArts.append(url)
        }
        self.coverArt = coverArts

        self.genres = try container.decode([String].self, forKey: .genres)

        self.id = try container.decode(String.self, forKey: .id)

        self.name = try container.decode(String.self, forKey: .name)

        self.songs = try container.decode([Song].self, forKey: .songs)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AlbumKeys.self)

        try container.encode(artist, forKey: .artist)

        var coverArtsContainer = container.nestedUnkeyedContainer(forKey: .coverArt)
        for coverArt in coverArt {
            var urlContainer = coverArtsContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
            try urlContainer.encode(coverArt, forKey: .url)
        }
        try container.encode(coverArt.map{ $0.absoluteString }, forKey: .coverArt)

        try container.encode(genres, forKey: .genres)

        try container.encode(id, forKey: .id)

        try container.encode(name, forKey: .name)

        try container.encode(songs, forKey: .songs)
    }
}
