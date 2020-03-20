//
//  ViewController.swift
//  GrailDiary
//
//  Created by Dahna on 3/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var POIs: [POI] = [POI(location: "Monarch Butterfly Biosphere Reserve", country: "Mexico" , clues: ["Place of migration for Monarchs", "Down South"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self as? UITableViewDelegate
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                if let addPOIVC = segue.destination as? AddPOIViewController {
                    addPOIVC.delegate = self
                }
                
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath =
                    tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = POIs[indexPath.row]
                }
            }
            
        }
//    }
    
}





extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell is not a POITableViewCell")
        }
        cell.poi = POIs[indexPath.row]
        
        return cell
        
        
    }
}
