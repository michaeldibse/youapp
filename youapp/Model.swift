//
//  Model.swift
//  youapp
//
//  Created by Michael Karbasch on 05.09.20.
//  Copyright © 2020 Michael Karbasch. All rights reserved.
//

import Foundation


class Model {
   
    
    func getVideos() {
        
        // Create a URL Object
        
        let url = URL(string: Constants.API_URL)
    
        guard url != nil else {
            return
        }
        
        // Get a session object
        
        let session = URLSession.shared
        
        // get a data task from the session object
       
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            // parsing the json into video objects
            
            do  {
                
                let decoder = JSONDecoder()
                           decoder.dateDecodingStrategy = .iso8601
                           
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            } catch {
                
            
            }
           
            
        }
        
        // Kick off the task
        
        dataTask.resume()
        
        
        
        
    }
    
    
}
