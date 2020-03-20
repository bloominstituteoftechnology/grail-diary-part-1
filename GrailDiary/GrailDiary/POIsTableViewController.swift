//
//  ViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 3/17/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var newPOI: [POI] = [POI(location: "CLEVELAND", country: "GUAM", clues: nil)]
    
    
    @IBOutlet weak var POITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        POITableView.dataSource = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            
            guard let segue.destination is AddPOIViewController,
            
            if segue.identifier == "ShowPOIDetailSegue" {
                
                guard let segue.destination is POIDetailViewController else {
                    return
                }
            }
                
                
                
                
           
           
        }
    }
}
  
    extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newPOI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = POITableView.dequeueReusableCell(withIdentifier: "AddPOIModalSegue", for: indexPath) as? POITableViewCell else {
            fatalError("Cell is not a POITableViewCell")
        }
        return cell
    }
}

    

