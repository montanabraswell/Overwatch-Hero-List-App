//
//  Hero.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import Foundation

// This is getting information from different data types and storing them

struct Hero: Decodable  {
    
    var tag: String?
    var health: Int?
    var armour: Int?
    var shield: Int?
    var real_name: String?
    var age: Int?
    var affiliation: String?
    var base_of_operations:String?
    var difficulty: Int?
}
