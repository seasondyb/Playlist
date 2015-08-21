//
//  Album.swift
//  Playlist
//
//  Created by Yibo Dai on 7/15/15.
//  Copyright (c) 2015 Yibo Dai. All rights reserved.
//

import Foundation

public struct AlbumKeys {

    static let title = "title"
    static let description = "description"
    static let coverImageName = "coverImageName"
    static let songs = "songs"
}

class Album {
    var title: String?
    var description: String?
    var coverImageName: String?
    var songs: [String]?
    
    //provide an index -> give me an album in the Library
    init (index: Int) {
        if index >= 0 && index < TheBeatlesLibrary().albumCollection.count {
            let album = TheBeatlesLibrary().albumCollection[index]

            title = album[AlbumKeys.title] as? String
            description = album[AlbumKeys.description] as? String
            coverImageName = album[AlbumKeys.coverImageName] as? String
            songs = album[AlbumKeys.songs] as? [String]
       }
    }
    
}

