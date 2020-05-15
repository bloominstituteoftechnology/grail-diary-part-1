//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Jake Connerly on 7/17/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    //
    // MARK: IBOutlets & Properties
    //
    
    var POIList: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!

    //
    // MARK: - Navigation
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addDetailVC       = segue.destination as? AddPOIViewController {
                addDetailVC.delegate = self
            }
        }else if segue.identifier == "ShowPOIDetailSegue" {
            if let showPOIVC  = segue.destination as? POIDetailViewController,
               let indexPath  = tableView.indexPathForSelectedRow {
                showPOIVC.poi = POIList[indexPath.row]
            }
        }
    }
    

} // <- end of POIsTableViewController class

//
//MARK: - Extensions
//

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = POIList[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ POI: POI) {
        POIList.append(POI)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
