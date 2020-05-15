//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Richard Gibbs on 5/14/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    
    @IBOutlet weak var POIsTableView: UITableView!
    
    
    var pois: [POI] = [POI(location: "Location", country: "Country", clues: ["Clues"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        POIsTableView.dataSource = self
    }


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    
    if segue.identifier == "ADDPOIModalSegue" {
        let poiTVC = segue.destination as? AddPOIViewController
        
        poiTVC?.delegate = self
    } else if segue.identifier == "ShowPOIDetailSegue" {
        _ = segue.destination as? POIDetailViewController
            
        }
        
    }
    }

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell identifier is wrong or the cell is not of expected type POITableViewCell")
        }
        
        let poi = pois[indexPath.row]
        cell.locationLabel.text = poi.location
        cell.countryLabel.text = poi.country
        cell.cluesLabel.text = "\(poi.clues.count) clue(s)"
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func POIWasCreated(poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        POIsTableView.reloadData()
    }
}

