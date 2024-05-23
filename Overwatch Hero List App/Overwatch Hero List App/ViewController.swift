//
//  ViewController.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = HeroService()
    var heroesToDisplay = [Hero]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Get the articles from the model
        model.delegate = self
        model.getHeroModel()
        
        // Set the viewcontroller as the datasource and delegate of the tableview
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let row = sender as! Int
        let hero = heroesToDisplay[row]
        let detailedVC = segue.destination as! DetailViewController
        
        detailedVC.hero = hero
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hero = heroesToDisplay[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroTableViewCell
        
        //cell.iconImageView?.image = UIImage(data: <#T##Data#>)
        cell.label?.text = hero.name
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped the cell")
        
        let segueID = "showDetailSegue"
        
        performSegue(withIdentifier: segueID, sender: indexPath.row)

    }
    
}

// MARK: - Hero Model Protocol Method

extension ViewController: HeroServiceProtocol {
    
    func heroListRetrieved(_ fetchedHeroes: [Hero]) {
        
        heroesToDisplay = fetchedHeroes
        tableView.reloadData()

        print(heroesToDisplay)
    }
}
