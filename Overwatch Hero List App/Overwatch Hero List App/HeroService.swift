//
//  HeroService.swift
//  Overwatch Hero List App
//
//  Created by Montana  on 4/3/24.
//

import Foundation
// responsible for taking the data from API, creating hero instances and communicating with VC 
// Creating class and declare a get function and create an instance in VC

protocol HeroServiceProtocol {
    
    func heroListRetrieved(_ heroes:[Hero])
}

class HeroService {
    
    var delegate:HeroServiceProtocol?
    
    func getHeroModel() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringURL = "https://overfast-api.tekrop.fr/heroes"
        
        // Create a URL object
        let url = URL(string: stringURL)
        
        // Check that it isn't nil
        guard let url = url else {
            print("Couldn't create url object")
            return
        }
        // Get the URL Session
        let session = URLSession.shared

        // Create the data task
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            // Check that there are no errors and that there is data
             if error == nil , let data = data  {
                
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json and store in variable
                    let heroes = try decoder.decode([Hero].self, from: data)
                    
                    
                    // Pass it back to the view controller
                    DispatchQueue.main.async {
                        self.delegate?.heroListRetrieved(heroes)
                    }
                
                }
                catch {
                    
                    print("Error parsing the json \(error)")
                } // End Do - Catch
            } // End if
            else {
                print("Missing Data or other Error in URL Session Data Task")
                print("Error: \(String(describing: error))")
                print("Data: \(String(describing: data))")
            }
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
    }
}
