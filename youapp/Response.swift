//
//  Response.swift
//  youapp
//
//  Created by Michael Karbasch on 21.09.20.
//  Copyright © 2020 Michael Karbasch. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey {
        
        case items
    }

    
     init (from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
}
