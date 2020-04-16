//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 4/16/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
 
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var pois: [POI] = [POI(location: "Fiji", country: "Fiji?", clues: ["He Was There", "It Was There"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
                   
                   let addPOIVC = segue.destination as? AddPOIViewController
                   
                   // Tell the delegator (NewFriendVC) that the table view controller will be it's delegate
                   
                   addPOIVC?.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
            guard let 
            
            let detailPOIVC = segue.destination as? POIDetailViewController
            
            detailPOIVC.delegate = self
            
        
        
        }
    }
}

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError("This is not a POICell") }
        
        let poi = pois[indexPath.row]
        
        cell.locationLabel.text = poi.location
        cell.countryLabel.text = poi.country
        cell.numberOfCluesLabel.text = "\(poi.clues.count) clues"
    
        return cell
    }
}
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
        pois.append(poi)
        tableView.reloadData()

    }
}
