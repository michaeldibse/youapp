//
//  Video.swift
//  youapp
//
//  Created by Michael Karbasch on 05.09.20.
//  Copyright © 2020 Michael Karbasch. All rights reserved.
//

import Foundation



struct Video: Decodable {
    
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedDate = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse the title
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse the description
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse the publish date
        
        self.publishedDate = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        // Parse in the right solution
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse VideoID
        
        let resourceIDContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIDContainer.decode(String.self, forKey: .videoId)
    }
    
}
