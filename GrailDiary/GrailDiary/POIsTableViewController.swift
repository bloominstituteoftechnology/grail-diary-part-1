//
//  ViewController.swift
//  GrailDiary
//
//  Created by Morgan Smith on 11/15/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var POIs: [POI] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                if let addPOIVC = segue.destination as? AddPOIViewController {
                    addPOIVC.delegate = self
                }
                
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let POIDetailVC = segue.destination as? POIDetailViewController {
                    POIDetailVC.thePOI = POIs[indexPath.row]
                }
            }
        }
    }

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let thePOI = POIs[indexPath.row]
        cell.thePOI = thePOI
        
        return cell 
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func POIWasCreated(_ thePOI: POI) {
        POIs.append(thePOI)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
