//
//  ViewController.swift
//  GrailDiary
//
//  Created by Nihal Erdal on 3/17/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois : [POI] = [POI(location: "Istanbul", country: "Turkey", clues: ["aa"])]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
           
            
        guard let addPOIVC = segue.destination as? AddPOIViewController else {return}
            
            addPOIVC.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
          guard  let poiDetailVC = segue.destination as? POIDetailViewController,
            
            let indexPath = tableView.indexPathForSelectedRow else { return }
            
            poiDetailVC.poi = pois[indexPath.row]
        }
    }
}
    
    
    extension POIsTableViewController : UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            pois.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else  {
            fatalError("error")
        }
        
        let poi = pois[indexPath.row]
        
        cell.locationLabel.text = poi.location
        cell.countryLabel.text = poi.country
        cell.cluesLabel.text = "\(poi.clues.count) of clues"
        

        return cell
    }
}

extension POIsTableViewController : AddPOIDelegate {
   
    func poiWasAdded(_ poi: POI){
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
