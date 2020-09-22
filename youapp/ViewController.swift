//
//  ViewController.swift
//  youapp
//
//  Created by Michael Karbasch on 30.08.20.
//  Copyright © 2020 Michael Karbasch. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
 
    
    var model = Model()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   
        model.getVideos()
        
       
    }


}

