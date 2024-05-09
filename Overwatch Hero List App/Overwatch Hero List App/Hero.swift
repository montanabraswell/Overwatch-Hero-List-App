//
//  Hero.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import Foundation

// This is getting information from different data types and storing them

//turning json into objects 
struct Hero: Decodable  {
    
    var key: String
    var name: String
    var portrait: String
    var role: String
}



