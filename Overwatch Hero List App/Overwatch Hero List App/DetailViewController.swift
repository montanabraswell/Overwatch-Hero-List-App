//
//  DetailViewController.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/17/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var roleLabel: UILabel!
    
    var hero: Hero? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = hero?.name
        roleLabel.text = hero?.role
        
    
        
        guard let heroPortrait = hero?.portrait else {
            print("Could not retrieve url image")
            return
        }
        
        
        guard let url = URL(string:heroPortrait) else {
            print ("Couldn't get url link")
            return
        }
       
        
        let dataTask = URLSession.shared.dataTask(with: url) { data , response, error in
            guard let data = data else {
                print(" Couldn't get data")
                return
            }
  
            
            if let error = error {
                print("Error was detected: \(error)")
            } else {
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                    print ("Image will be displayed")
                }
            }
        
        }
        dataTask.resume()
    }
}
       
        


