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
    
    
    @IBOutlet weak var roleLabel: UILabel!
    
    var hero: Hero? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = hero?.name
        roleLabel.text = hero?.role
        
        print(hero)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
