//
//  ViewController.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import UIKit

class ViewController: UIViewController, HeroModelProtocol {

    var model = HeroModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the articles from the model
        model.delegate = self
        model.getHeroModel()
        
        
        // Do any additional setup after loading the view.
    }


    // MARK: - Hero Model Protocol Method
    
    func HeroListRetrieved(_ heroes: [Hero]) {
        print("Moira is the true DPS Support in OW. :)")
    }
}

