//
//  HeroModel.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import Foundation

// Creating class and declare a get function and create an instance in VC

protocol HeroModelProtocol {
    
    func HeroListRetrieved(_ heroes:[Hero])
}
class HeroModel {
    
    var delegate:HeroModelProtocol?
    
    func getHeroModel() {
        
        // Fire off the request to the API
        
        // Parse the returned JSON into hero instance and pass it back to the view controller with the  protocol and delegate pattern
        delegate?.HeroListRetrieved([Hero]())
    }
}
