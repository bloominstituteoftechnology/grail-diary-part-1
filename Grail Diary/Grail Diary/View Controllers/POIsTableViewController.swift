//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Niranjan Kumar on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var pois: [POI] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self (add UITableViewDelegate) to the UITableViewDataSource Protocol Below
//        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
            addPOIVC.delegate = self
            }
        }
        else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                 let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = pois[indexPath.row]
                
            }
            
        }
            
    }
}





extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
    // you cannot implement this method until TableViewCell has the optional variable ready (Step 9 & 10) (Need to complete step 33)
        
        return cell
    }
}


extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        // Append the poi that was passed into the method to your array
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
